# frozen_string_literal: true

module Jekyll
  module TableOfContents
    # jekyll-toc configuration class
    class Configuration
      attr_accessor :toc_levels, :no_toc_class, :no_toc_section_class,
                    :list_class, :sublist_class, :item_class, :item_prefix

      DEFAULT_CONFIG = {
        'min_level' => 1,
        'max_level' => 6,
        'no_toc_section_class' => 'no_toc_section',
        'list_class' => 'section-nav',
        'sublist_class' => '',
        'item_class' => 'toc-entry',
        'item_prefix' => 'toc-'
      }.freeze

      def initialize(options)
        options = generate_option_hash(options)

        @toc_levels = options['min_level']..options['max_level']
        @no_toc_class = 'no_toc'
        @no_toc_section_class = options['no_toc_section_class']
        @list_class = options['list_class']
        @sublist_class = options['sublist_class']
        @item_class = options['item_class']
        @item_prefix = options['item_prefix']
      end

      private

      def generate_option_hash(options)
        DEFAULT_CONFIG.merge(options)
      rescue TypeError
        DEFAULT_CONFIG
      end
    end
  end
end

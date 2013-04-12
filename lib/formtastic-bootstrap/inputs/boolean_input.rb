# TODO See if this can be refactored to make use of some of the Choices code.
module FormtasticBootstrap
  module Inputs
    class BooleanInput < Formtastic::Inputs::BooleanInput
      include Base

      def to_html
        control_group_wrapping do
          controls_wrapping do
            label_with_nested_checkbox
          end
        end
      end

      def label_with_nested_checkbox
        builder.label(
          method,
          options[:label_outside] ? check_box_html : label_text_with_embedded_checkbox,
          label_html_options.tap do |options|
            options[:class] << "checkbox"
          end
        )
      end

    end
  end
end

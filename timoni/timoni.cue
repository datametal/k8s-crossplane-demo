// Code generated by timoni. DO NOT EDIT.
// Note that this file is required and should contain
// the values schema and the timoni workflow.

package main

import (
	crossplane "apiextensions.crossplane.io/composition/v1"
	templates "timoni.sh/timoni/templates"
)

values: templates.#Config

timoni: {
	apiVersion: "v1alpha1"

	instance: templates.#Instance & {
		config: values
		config: metadata: {
			name:      string @tag(name)
			namespace: string @tag(namespace)
		}
		config: compositeTypeRef: {
			apiVersion: string @tag(apiVersion)
			kind:       string @tag(kind)
		}
		config: resources?: [...crossplane.#ComposedTemplate]
	}
	apply: all: [ for obj in instance.objects {obj}]
}

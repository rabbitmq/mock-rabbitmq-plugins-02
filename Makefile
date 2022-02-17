PROJECT = mock_rabbitmq_plugins_02
PROJECT_DESCRIPTION = A mock RabbitMQ plugin to be used in tests
PROJECT_MOD = mock_rabbitmq_plugins_01_app

define PROJECT_ENV
[]
endef

define PROJECT_APP_EXTRA_KEYS
	{vsn, "0.2.0"},
	{modules, ['mock_rabbitmq_plugins_02_app', 'mock_rabbitmq_plugins_02_sup']},
	{registered, [mock_rabbitmq_plugins_02_sup]},
	{applications, [kernel, stdlib, rabbit]},
	{mod, {mock_rabbitmq_plugins_02_app, []}},
	{broker_version_requirements, []}
endef

LOCAL_DEPS = inets
DEPS = rabbit

DEP_EARLY_PLUGINS = rabbit_common/mk/rabbitmq-early-plugin.mk
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include ../../rabbitmq-components.mk
include ../../erlang.mk

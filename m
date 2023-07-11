Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624A1EA8D;
	Tue, 11 Jul 2023 21:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7A0C433C7;
	Tue, 11 Jul 2023 21:24:59 +0000 (UTC)
Date: Tue, 11 Jul 2023 17:24:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:trace/core 21/22] include/linux/ftrace.h:47:47: warning:
 declaration of 'struct fgraph_ret_regs' will not be visible outside of this
 function
Message-ID: <20230711172456.2b6b584e@gandalf.local.home>
In-Reply-To: <202307120418.wmSazUy7-lkp@intel.com>
References: <202307120418.wmSazUy7-lkp@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Jul 2023 05:05:45 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
> head:   46b77ea28faeed56f1d1b63f9049c40b9eb3cbf5
> commit: 55803539764e831c4e642de1c6634f8f645a10aa [21/22] tracing: arm64: Avoid missing-prototype warnings
> config: i386-randconfig-i012-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120418.wmSazUy7-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120418.wmSazUy7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307120418.wmSazUy7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from kernel/power/process.c:15:
>    In file included from include/linux/syscalls.h:88:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:10:
>    In file included from include/linux/perf_event.h:52:
> >> include/linux/ftrace.h:47:47: warning: declaration of 'struct fgraph_ret_regs' will not be visible outside of this function [-Wvisibility]  
>    unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
>                                                  ^
>    1 warning generated.
> 
> 
> vim +47 include/linux/ftrace.h
> 
>     45	
>     46	#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>   > 47	unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);  
>     48	#else
>     49	unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
>     50	#endif
>     51	
> 

My fixed up to Arnd's patch caused this. Here's a new version:

From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] tracing: arm64: Avoid missing-prototype warnings

These are all tracing W=1 warnings in arm64 allmodconfig about missing
prototypes:

kernel/trace/trace_kprobe_selftest.c:7:5: error: no previous prototype for 'kprobe_trace_selftest_target' [-Werror=missing-pro
totypes]
kernel/trace/ftrace.c:329:5: error: no previous prototype for '__register_ftrace_function' [-Werror=missing-prototypes]
kernel/trace/ftrace.c:372:5: error: no previous prototype for '__unregister_ftrace_function' [-Werror=missing-prototypes]
kernel/trace/ftrace.c:4130:15: error: no previous prototype for 'arch_ftrace_match_adjust' [-Werror=missing-prototypes]
kernel/trace/fgraph.c:243:15: error: no previous prototype for 'ftrace_return_to_handler' [-Werror=missing-prototypes]
kernel/trace/fgraph.c:358:6: error: no previous prototype for 'ftrace_graph_sleep_time_control' [-Werror=missing-prototypes]
arch/arm64/kernel/ftrace.c:460:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]
arch/arm64/kernel/ptrace.c:2172:5: error: no previous prototype for 'syscall_trace_enter' [-Werror=missing-prototypes]
arch/arm64/kernel/ptrace.c:2195:6: error: no previous prototype for 'syscall_trace_exit' [-Werror=missing-prototypes]

Move the declarations to an appropriate header where they can be seen
by the caller and callee, and make sure the headers are included where
needed.

Link: https://lore.kernel.org/linux-trace-kernel/20230517125215.930689-1-arnd@kernel.org

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Florent Revest <revest@chromium.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
[ Fixed ftrace_return_to_handler() to handle CONFIG_HAVE_FUNCTION_GRAPH_RETVAL case ]
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/arm64/include/asm/ftrace.h      | 4 ++++
 arch/arm64/include/asm/syscall.h     | 3 +++
 arch/arm64/kernel/syscall.c          | 3 ---
 include/linux/ftrace.h               | 9 +++++++++
 kernel/trace/fgraph.c                | 1 +
 kernel/trace/ftrace_internal.h       | 5 +++--
 kernel/trace/trace_kprobe_selftest.c | 3 +++
 7 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 21ac1c5c71d3..ab158196480c 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -211,6 +211,10 @@ static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs
 {
 	return ret_regs->fp;
 }
+
+void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
+			   unsigned long frame_pointer);
+
 #endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER  */
 #endif
 
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 4cfe9b49709b..ab8e14b96f68 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -85,4 +85,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
+int syscall_trace_enter(struct pt_regs *regs);
+void syscall_trace_exit(struct pt_regs *regs);
+
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 5a668d7f3c1f..b1ae2f2eaf77 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -75,9 +75,6 @@ static inline bool has_syscall_work(unsigned long flags)
 	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
-int syscall_trace_enter(struct pt_regs *regs);
-void syscall_trace_exit(struct pt_regs *regs);
-
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 8e59bd954153..ce156c7704ee 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -41,6 +41,15 @@ struct ftrace_ops;
 struct ftrace_regs;
 struct dyn_ftrace;
 
+char *arch_ftrace_match_adjust(char *str, const char *search);
+
+#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
+struct fgraph_ret_regs;
+unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
+#else
+unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
+#endif
+
 #ifdef CONFIG_FUNCTION_TRACER
 /*
  * If the arch's mcount caller does not support all of ftrace's
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index cd2c35b1dd8f..c83c005e654e 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -15,6 +15,7 @@
 #include <trace/events/sched.h>
 
 #include "ftrace_internal.h"
+#include "trace.h"
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 #define ASSIGN_OPS_HASH(opsname, val) \
diff --git a/kernel/trace/ftrace_internal.h b/kernel/trace/ftrace_internal.h
index 382775edf690..5012c04f92c0 100644
--- a/kernel/trace/ftrace_internal.h
+++ b/kernel/trace/ftrace_internal.h
@@ -2,6 +2,9 @@
 #ifndef _LINUX_KERNEL_FTRACE_INTERNAL_H
 #define  _LINUX_KERNEL_FTRACE_INTERNAL_H
 
+int __register_ftrace_function(struct ftrace_ops *ops);
+int __unregister_ftrace_function(struct ftrace_ops *ops);
+
 #ifdef CONFIG_FUNCTION_TRACER
 
 extern struct mutex ftrace_lock;
@@ -15,8 +18,6 @@ int ftrace_ops_test(struct ftrace_ops *ops, unsigned long ip, void *regs);
 
 #else /* !CONFIG_DYNAMIC_FTRACE */
 
-int __register_ftrace_function(struct ftrace_ops *ops);
-int __unregister_ftrace_function(struct ftrace_ops *ops);
 /* Keep as macros so we do not need to define the commands */
 # define ftrace_startup(ops, command)					\
 	({								\
diff --git a/kernel/trace/trace_kprobe_selftest.c b/kernel/trace/trace_kprobe_selftest.c
index 16548ee4c8c6..3851cd1e6a62 100644
--- a/kernel/trace/trace_kprobe_selftest.c
+++ b/kernel/trace/trace_kprobe_selftest.c
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "trace_kprobe_selftest.h"
+
 /*
  * Function used during the kprobe self test. This function is in a separate
  * compile unit so it can be compile with CC_FLAGS_FTRACE to ensure that it
-- 
2.40.1


Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F252CA0
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 22:11:20 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id n198-20020a2540cf000000b00614c2ee23b7so8599346yba.9
        for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MHbMxovO6AcAN2vYhPcfy5isPlyEXuvf7h8ZW6A2Y+Y=;
        b=JCvw8MBgwkGImJIrpAHCQh0U5vi/BlQwmJPfV3rLDETbMfh6yfDO4M0JWJBqIFu7TJ
         TETjHmFWbv8fiQozxuzy1HUOPJsr3K5tWuj4R9UEgdiI50+VvKsvJ5MsKSagJExL9Fju
         0PRFYzsN3Q0/gbZokFUXD2hxuaKKvIWacV5b2XthgTVM1FtGYJnfyl9t/0dsOoTGRkCQ
         dtbPluEjCNANUna5lmsz23rG9VD0w9KhYvGUfpCIbS/0bGlOrn8/4OC+aQzwJQK76QL9
         YDS+dr4DylDWMaiYXN9mtpprN7MiRjc5TmMD/zb0AKoGoSgxbvTYzdtxuZMiYrj6er78
         v4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MHbMxovO6AcAN2vYhPcfy5isPlyEXuvf7h8ZW6A2Y+Y=;
        b=2bAaeOdM8syEifv99xdy1b3gvkZYlUfDm+7uCERt6UHHQsp5rO25zRDoaVbOcAd407
         QJk/mh0RHHsr23vREYnUtyUi4nHJKPXoLAMlQ2rNerOMgH7NFP+Qk3xrzRBH+N1Pd2Lz
         ETLawtgcOiCLDC7Z8r3wIkOgmRvwZ056oH1Bt06beTf0C33HBg0ouP+iXWIuh7H/OrG6
         lYQo3+ZM5Ga6Ys1gRuCWeXQZhyi3cXm5mwhi4w2QexrdKb7n3rlKqTMmEBJoC9mQ01QO
         7a7Uy6gV71h6rh0ggaC3fqC8+pkgdkxdFmBbTmi9hdExKPchOQygiGB00oMBqLyfCHav
         wO0A==
X-Gm-Message-State: AOAM530llQfU87HmnFiQpuMr5VqpM9SKk2SEgmC47XeVG7KdyH+TO+Kc
	MD9zqnUpiInKm7iBvISYhyt5UT6qaUaopkPqxRk2
X-Google-Smtp-Source: ABdhPJwN3KVWegxyHHiIXTTmlstEucD6pQ1XLu2joNb+rGzqKl4AWrQa2pDPchrhP0iDqpgB5lXQxHdcXS1/oMS+vh8d
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2cd:203:c864:1e56:28bc:526b])
 (user=axelrasmussen job=sendgmr) by 2002:a25:9988:: with SMTP id
 p8mr8106207ybo.128.1643321479925; Thu, 27 Jan 2022 14:11:19 -0800 (PST)
Date: Thu, 27 Jan 2022 14:11:15 -0800
Message-Id: <20220127221115.3731388-1-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH] selftests: fixup build warnings in pidfd / clone3 tests
From: Axel Rasmussen <axelrasmussen@google.com>
To: Christian Brauner <christian@brauner.io>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: "Zach O'Keefe" <zokeefe@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"

These are some trivial fixups, which were needed to build the tests with
clang and -Werror. The following issues are fixed:

- Remove various unused variables.
- In child_poll_leader_exit_test, clang isn't smart enough to realize
  syscall(SYS_exit, 0) won't return, so it complains we never return
  from a non-void function. Add an extra exit(0) to appease it.
- In test_pidfd_poll_leader_exit, ret may be branched on despite being
  uninitialized, if we have !use_waitpid. Initialize it to zero to get
  the right behavior in that case.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/clone3/clone3.c    | 2 --
 tools/testing/selftests/pidfd/pidfd_test.c | 6 +++---
 tools/testing/selftests/pidfd/pidfd_wait.c | 5 ++---
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index 076cf4325f78..cd4582129c7d 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -126,8 +126,6 @@ static void test_clone3(uint64_t flags, size_t size, int expected,
 
 int main(int argc, char *argv[])
 {
-	pid_t pid;
-
 	uid_t uid = getuid();
 
 	ksft_print_header();
diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index 529eb700ac26..9a2d64901d59 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -441,7 +441,6 @@ static void test_pidfd_poll_exec(int use_waitpid)
 {
 	int pid, pidfd = 0;
 	int status, ret;
-	pthread_t t1;
 	time_t prog_start = time(NULL);
 	const char *test_name = "pidfd_poll check for premature notification on child thread exec";
 
@@ -500,13 +499,14 @@ static int child_poll_leader_exit_test(void *args)
 	 */
 	*child_exit_secs = time(NULL);
 	syscall(SYS_exit, 0);
+	/* Never reached, but appeases compiler thinking we should return. */
+	exit(0);
 }
 
 static void test_pidfd_poll_leader_exit(int use_waitpid)
 {
 	int pid, pidfd = 0;
-	int status, ret;
-	time_t prog_start = time(NULL);
+	int status, ret = 0;
 	const char *test_name = "pidfd_poll check for premature notification on non-empty"
 				"group leader exit";
 
diff --git a/tools/testing/selftests/pidfd/pidfd_wait.c b/tools/testing/selftests/pidfd/pidfd_wait.c
index be2943f072f6..17999e082aa7 100644
--- a/tools/testing/selftests/pidfd/pidfd_wait.c
+++ b/tools/testing/selftests/pidfd/pidfd_wait.c
@@ -39,7 +39,7 @@ static int sys_waitid(int which, pid_t pid, siginfo_t *info, int options,
 
 TEST(wait_simple)
 {
-	int pidfd = -1, status = 0;
+	int pidfd = -1;
 	pid_t parent_tid = -1;
 	struct clone_args args = {
 		.parent_tid = ptr_to_u64(&parent_tid),
@@ -47,7 +47,6 @@ TEST(wait_simple)
 		.flags = CLONE_PIDFD | CLONE_PARENT_SETTID,
 		.exit_signal = SIGCHLD,
 	};
-	int ret;
 	pid_t pid;
 	siginfo_t info = {
 		.si_signo = 0,
@@ -88,7 +87,7 @@ TEST(wait_simple)
 
 TEST(wait_states)
 {
-	int pidfd = -1, status = 0;
+	int pidfd = -1;
 	pid_t parent_tid = -1;
 	struct clone_args args = {
 		.parent_tid = ptr_to_u64(&parent_tid),
-- 
2.35.0.rc2.247.g8bbb082509-goog


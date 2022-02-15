Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C71578
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 15:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79C1C340F2;
	Tue, 15 Feb 2022 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644939016;
	bh=qJwGXYo41BOzEX6oFtnAmcbygBymqUp/dIQMb+BAvlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=toB1+tjH280Rxab4Nq+JVo9pwKh2LgmrB5RKdUOE/uZduzmBq6H+kPVbMKU0zRciA
	 mJjElqXB+Ia5qWu2VXlLauPBAzOeaYc1Q9ofQ0lXVEmFzAEM9TYe0xuoRL/CQ7QIf4
	 rnKuOUhTgWna9N07VFKM84d6t5MwYgLND1GNat21OPZwIn9oU4schUGBp82J0EQka1
	 vVU/wx9wZgxXVB0Y+nQ9XZERS9IK36MLzCBk6vtTVihqYDYp7j+g2FssWEL1QI85OU
	 5dgVJLSKVjPoRRLQnzy253nP6+t3FBLXl2mvZFf1bRKOGw1n0MJwlQUR6F9Pq8YZdO
	 u7daHQgz5gUiw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Rasmussen <axelrasmussen@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 11/23] selftests: fixup build warnings in pidfd / clone3 tests
Date: Tue, 15 Feb 2022 10:29:45 -0500
Message-Id: <20220215152957.581303-11-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152957.581303-1-sashal@kernel.org>
References: <20220215152957.581303-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Axel Rasmussen <axelrasmussen@google.com>

[ Upstream commit e2aa5e650b07693477dff554053605976789fd68 ]

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
Acked-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/clone3/clone3.c    | 2 --
 tools/testing/selftests/pidfd/pidfd_test.c | 6 +++---
 tools/testing/selftests/pidfd/pidfd_wait.c | 5 ++---
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index 076cf4325f783..cd4582129c7d6 100644
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
index 529eb700ac26a..9a2d64901d591 100644
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
index be2943f072f60..17999e082aa71 100644
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
2.34.1


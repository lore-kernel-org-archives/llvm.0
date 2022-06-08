Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BA7C
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 01:22:17 +0000 (UTC)
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id 2581CmJd031276
	for <llvm@lists.linux.dev>; Wed, 8 Jun 2022 10:12:49 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-12.nifty.com with ESMTP id 2581BA8I031282;
	Wed, 8 Jun 2022 10:11:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2581BA8I031282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654650671;
	bh=FJ3d90hFDqNnz9JEYs7jnADjBvnY8aZMKAyphj9j8FQ=;
	h=From:To:Cc:Subject:Date:From;
	b=yjghWcWwYRMxitZyUL2cfl8eITvmxadWxCDw0SbMcpKz2MyXGgJ+ly1TSPq/ZOREo
	 15X7U57MtiIJ+iw69dnAG2fAVfXzNOtbxwf/6fsGjoLa/8F5vr95LcwUQLlvI5+OoY
	 fPcdFnEwctsFeXpUQ6wup9+sWM7YqSYTye0Zj7BP8MsqCJS5CQR8+XNgPWbJqBhnJN
	 dFLjZewr5F69CjZd7dvtgN1BNxa6sh8+ntRjJnhWohhJ7gEz66HKzCSyEXX5kzNaH/
	 74n+TtbTuy6Fnxp9SSGg/pv+cO68yI3uwqcxTojgsCEUQTIe+L22RaS4ERoNLgZ74p
	 ckqlw5FGFWH3g==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Wang Yugui <wangyugui@e16-tech.com>, Jon Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH v3] scripts/check-local-export: avoid 'wait $!' for process substitution
Date: Wed,  8 Jun 2022 10:11:00 +0900
Message-Id: <20220608011100.486735-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bash 4.4, released in 2016, supports 'wait $!' to check the exit status
of a process substitution, but it seems too new.

Some people using older bash versions (on CentOS 7, Ubuntu 16.04, etc.)
reported an error like this:

  ./scripts/check-local-export: line 54: wait: pid 17328 is not a child of this shell

I used the process substitution to avoid a pipeline, which executes each
command in a subshell. If the while-loop is executed in the subshell
context, variable changes within are lost after the subshell terminates.

Fortunately, Bash 4.2, released in 2011, supports the 'lastpipe' option,
which runs the last element of a pipeline in the current shell process.

Also, set 'pipefail' to catch errors from ${NM}.

Add the bash requirement to Documentation/process/changes.rst.

Fixes: 31cb50b5590f ("kbuild: check static EXPORT_SYMBOL* by script instead of modpost")
Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Wang Yugui <wangyugui@e16-tech.com>
Tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - Add "TODO:" to the comment block (Nick)

Changes in v2:
  - Add bash to Documentation/process/changes.rst

 Documentation/process/changes.rst | 12 +++++++++++
 scripts/check-local-export        | 36 ++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 34415ae1af1b..19c286c23786 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -32,6 +32,7 @@ you probably needn't concern yourself with pcmciautils.
 GNU C                  5.1              gcc --version
 Clang/LLVM (optional)  11.0.0           clang --version
 GNU make               3.81             make --version
+bash                   4.2              bash --version
 binutils               2.23             ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
@@ -84,6 +85,12 @@ Make
 
 You will need GNU make 3.81 or later to build the kernel.
 
+Bash
+----
+
+Some bash scripts are used for the kernel build.
+Bash 4.2 or newer is needed.
+
 Binutils
 --------
 
@@ -362,6 +369,11 @@ Make
 
 - <ftp://ftp.gnu.org/gnu/make/>
 
+Bash
+----
+
+- <ftp://ftp.gnu.org/gnu/bash/>
+
 Binutils
 --------
 
diff --git a/scripts/check-local-export b/scripts/check-local-export
index da745e2743b7..6ccc2f467416 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -8,11 +8,31 @@
 
 set -e
 
+# catch errors from ${NM}
+set -o pipefail
+
+# Run the last element of a pipeline in the current shell.
+# Without this, the while-loop would be executed in a subshell, and
+# the changes made to 'symbol_types' and 'export_symbols' would be lost.
+shopt -s lastpipe
+
 declare -A symbol_types
 declare -a export_symbols
 
 exit_code=0
 
+# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
+# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
+# '2>/dev/null'. However, it suppresses real error messages as well. Add a
+# hand-crafted error message here.
+#
+# TODO:
+# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
+# binutils to 2.37, llvm to 13.0.0.
+# Then, the following line will be really simple:
+#   ${NM} --quiet ${1} |
+
+{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
 while read value type name
 do
 	# Skip the line if the number of fields is less than 3.
@@ -37,21 +57,7 @@ do
 	if [[ ${name} == __ksymtab_* ]]; then
 		export_symbols+=(${name#__ksymtab_})
 	fi
-
-	# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm)
-	# shows 'no symbols' diagnostic (but exits with 0). It is harmless and
-	# hidden by '2>/dev/null'. However, it suppresses real error messages
-	# as well. Add a hand-crafted error message here.
-	#
-	# Use --quiet instead of 2>/dev/null when we upgrade the minimum version
-	# of binutils to 2.37, llvm to 13.0.0.
-	#
-	# Then, the following line will be really simple:
-	#   done < <(${NM} --quiet ${1})
-done < <(${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } )
-
-# Catch error in the process substitution
-wait $!
+done
 
 for name in "${export_symbols[@]}"
 do
-- 
2.32.0


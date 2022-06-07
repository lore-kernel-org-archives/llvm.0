Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00E15A2
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 08:50:32 +0000 (UTC)
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-04.nifty.com with ESMTP id 2578iaai019769
	for <llvm@lists.linux.dev>; Tue, 7 Jun 2022 17:44:36 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 2578hKA3010951;
	Tue, 7 Jun 2022 17:43:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 2578hKA3010951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654591401;
	bh=Cj3y+Qp/VjL00R1LaGKflQeOz1WUkQnA5jR/e3iAuTM=;
	h=From:To:Cc:Subject:Date:From;
	b=LIef4QxqITUfGQJLjVLGmPDVSHahO1iLHJEyvQCP/1vbQh/kGp+1JVcoUX3Nu8sAM
	 MGSQF50CK+RvFQSRHkI0DdO99FAdS8fK/ZZmxYWm27wZsAH7DJ/WdMESOJbKSJoG19
	 bUv7OfHclT08KCLgRNQslG5x0cb7KhVvzXzEzWucWgBMV0/MrPwa2pHkqPV8HjyuC8
	 5V7BlQ0CF0nlW+7W6tZUx+E/uIU9AtAUowItiLsSrry4ECySlBdF5GcxU3hNF8uA5K
	 jgOxJdw5GUDDi4gNXs8GlHu4ArK61UkOhzHsx9X7/5WajN+kl/+eYxTUIq3R8oSKTl
	 UR2zNdTIAwG1Q==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Wang Yugui <wangyugui@e16-tech.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] scripts/check-local-export: avoid 'wait $!' for process substitution
Date: Tue,  7 Jun 2022 17:43:17 +0900
Message-Id: <20220607084317.211785-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bash>=4.4 supports 'wait $!' to check the exit status of a process
substitution, but some people using older bash versions reported an
error like this:

  ./scripts/check-local-export: line 54: wait: pid 17328 is not a child of this shell

I used the process substitution because a pipeline executes each command
in a subshell; variables modified within the while-loop in the subshell
context would be lost after the subshell terminates.

Fortunately, Bash>=4.2 supports the 'lastpipe' option, which runs the
last element of a pipeline in the current shell process.

Also, set 'pipefail' to catch errors from ${NM}.

Bash 4.2, released in 2011, is 5 years older than Bash 4.4.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Wang Yugui <wangyugui@e16-tech.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/check-local-export | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/scripts/check-local-export b/scripts/check-local-export
index da745e2743b7..e21c7b54885d 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -8,11 +8,30 @@
 
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
+# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
+# binutils to 2.37, llvm to 13.0.0.
+#
+# Then, the following line will be really simple:
+#   ${NM} --quiet ${1} |
+{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
 while read value type name
 do
 	# Skip the line if the number of fields is less than 3.
@@ -37,21 +56,7 @@ do
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


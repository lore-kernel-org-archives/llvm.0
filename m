Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA92F4A
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 21:35:07 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id v1so361995ejg.13
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 14:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jlsqq7ENvzaBFmYrM2EurpWQmALPa/xYxdqi5jsfiWY=;
        b=CXF+NeUoCyYJUvbNACNtBhwGfBuGl/3hLER61cBCZPQ7uXOUZldZy83nBEMs77hhqN
         BL6+m5kaNZ3H4xImv0ykiTvblGE1e4GBPCsiobg0vr192yJdFpOOfQxu6BahlTTHi2mk
         N5j3FUWMqS/DwNSBh0ARdPbBjd9Cyiy/usgR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jlsqq7ENvzaBFmYrM2EurpWQmALPa/xYxdqi5jsfiWY=;
        b=uADTvee6MjdLk/qTaEvbP4icr6pJeuKnnDBB9TlLNziQwF4/k4y4pAJi3J/GjUo9c4
         bE1zgUPyh6RlDrdQcE20z9J1/5PZC4OEBwi70yqHiDSe8ruUn9Z0E4goGDIqdZv5GJTu
         j9TT1vNB6dUdQSeh8Ykas5AOJWJa+087quIs4Wv1IlfXmGrf9XqyutZfYwg0h3OXk/jB
         +LU/3K6maZfSvFZpYxogTk168jEO7EnvGnqlb4WNovSJjZPec/e5hfTv7QlDTOO0gcVR
         qh3PtSZxxp4oLKqRfNpxkwACjPI6oET6QHPMzW8gbBNLkRbHUoYF1C2PaEIpWPG4IayH
         YD0w==
X-Gm-Message-State: AOAM533C98KlKjYijxYpSrzXqUzHxfxjcpaDRp7o2JEMOj3zs7drKGba
	xm9WPwBIchhYfxgG0OAOEsn9fg==
X-Google-Smtp-Source: ABdhPJy/68a6lYrN5y9k/UonqDtcQMXjmnR26kEr0kn41xqIIOcZuheVhyVvg6y4boW5DKUtnd3hpA==
X-Received: by 2002:a17:907:868c:b0:6fe:fd7a:e0d7 with SMTP id qa12-20020a170907868c00b006fefd7ae0d7mr41997149ejc.90.1654896905963;
        Fri, 10 Jun 2022 14:35:05 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id f16-20020a170906085000b006fec4ee28d0sm80783ejd.189.2022.06.10.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:35:05 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: use a pipe rather than process substitution
Date: Fri, 10 Jun 2022 23:34:52 +0200
Message-Id: <20220610213453.630304-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Bash process substitution of the form `foo < <(bar)`, as found in
scripts/check-local-export, can cause issues in chrooted environments
and with tools such as pseudo. The blamed commit started to cause build
errors for me when using the Yocto project's devshell environment;
devshell uses pseudo internally:

.../scripts/check-local-export: line 51: /dev/fd/63: No such file or directory

Replace the process substitution with a simple pipe into the while loop.
This is functionally equivalent and more portable than the former. Note
that pipefail is enabled so that the script terminates when ${NM} fails.

Link: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13288
Fixes: 31cb50b5590f ("kbuild: check static EXPORT_SYMBOL* by script instead of modpost")
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 scripts/check-local-export | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/check-local-export b/scripts/check-local-export
index da745e2743b7..42de6f8f2541 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -7,12 +7,24 @@
 # EXPORT_SYMBOL should be used for global symbols.
 
 set -e
+set -o pipefail
 
 declare -A symbol_types
 declare -a export_symbols
 
 exit_code=0
 
+# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm)
+# shows 'no symbols' diagnostic (but exits with 0). It is harmless and
+# hidden by '2>/dev/null'. However, it suppresses real error messages
+# as well. Add a hand-crafted error message here.
+#
+# Use --quiet instead of 2>/dev/null when we upgrade the minimum version
+# of binutils to 2.37, llvm to 13.0.0.
+#
+# Then, the following line will be really simple:
+#   done < <(${NM} --quiet ${1})
+(${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } ) | \
 while read value type name
 do
 	# Skip the line if the number of fields is less than 3.
@@ -37,21 +49,7 @@ do
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
2.36.1


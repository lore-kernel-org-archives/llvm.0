Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729D8C15
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 15:40:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F146C732;
	Thu, 20 Apr 2023 15:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F146C732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1682005240; bh=UF61JW6oRtLJIYx10KbxIyUy5rSXTyyXgGlY7V2DrHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qcb4dlTc5ho5ToPMXUQ80Nry1hsqMBl2qEbaTo4ZKLPU3xmAuicagZzKzCd+LxXaj
	 jxZ0adq+YtQ6huKRsNejlznrRbNlCMNy8ZqBQruRdYn/G79kOgt9bjdwaEZM8thry5
	 c4GRXrjPaShA+V7Mr3otYovIIStDnFB+mqFGLFdiBT3aYlSDzu0UFL8cr0PbWzDc/Z
	 iLddw/ryvzvL5VchGaN3+8ymqcXzJNXmDA7CHhyV0/roHnxHGUCHQmCUlGBPmHpeGZ
	 nO9/C2KW+UZQy8v7stRhB0Q+zePmY7CnNITn4qLN53b0CpDXrsWNHcFU49jq55WNNS
	 yCfVXzeQCQSHA==
From: Jonathan Corbet <corbet@lwn.net>
To: Zipeng Zhang <zhangzipeng0@foxmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 masahiroy@kernel.org, codeagain@codeagain.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Zipeng Zhang <zhangzipeng0@foxmail.com>
Subject: Re: [PATCH] Documentation/process/changes: Escape --options to fix
 Sphinx output
In-Reply-To: <87sfcuu0fm.fsf@meer.lwn.net>
References: <tencent_CB1A298D31FD221496FF657CD7EF406E6605@qq.com>
 <87sfcuu0fm.fsf@meer.lwn.net>
Date: Thu, 20 Apr 2023 09:40:39 -0600
Message-ID: <87o7nitvd4.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> writes:

> The right solution, if it is possible, is to convince Sphinx to stop
> messing with "--" altogether.  Substituting em-dashes is of limited
> cosmetic value and, I think, is something we could do without.

Ah ... I get it now.  We *did* disable this once by disabling the
"html_use_smartypants" option in conf.py.  The Sphinx folks changed the
name of that option in the 1.6.6 release, though, silently turning that
behavior back on.  It only took us five years to notice...  I think I'll
just drop the attached patch into docs-next.

Thanks for bringing this up!

jon

------------8<-----------------
From 995addeb4ab2a2c4beaf8b90a4dc8c1d64735d29 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 20 Apr 2023 09:34:35 -0600
Subject: [PATCH] docs: turn off "smart quotes" in the HTML build

We have long disabled the "html_use_smartypants" option to prevent Sphinx
from mangling "--" sequences (among others).  Unfortunately, Sphinx changed
that option to "smartquotes" in the 1.6.6 release, and seemingly didn't see
fit to warn about the use of the obsolete option, resulting in the
aforementioned mangling returning.  Disable this behavior again and hope
that the option name stays stable for a while.

Reported-by: Zipeng Zhang <zhangzipeng0@foxmail.com>
Link: https://lore.kernel.org/lkml/tencent_CB1A298D31FD221496FF657CD7EF406E=
6605@qq.com
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index db16814f182f..3d1f74f76e64 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -343,9 +343,10 @@ sys.stderr.write("Using %s theme\n" % html_theme)
 # so a file named "default.css" will overwrite the builtin "default.css".
 html_static_path =3D ['sphinx-static']
=20
-# If true, SmartyPants will be used to convert quotes and dashes to
-# typographically correct entities.
-html_use_smartypants =3D False
+# If true, Docutils "smart quotes will be used to convert quotes and dashes
+# to typographically correct entities.  This will convert "--" to "=E2=80=
=94",
+# which is not always what we want, so disable it.
+smartquotes =3D False
=20
 # Custom sidebar templates, maps document names to template names.
 # Note that the RTD theme ignores this
--=20
2.40.0


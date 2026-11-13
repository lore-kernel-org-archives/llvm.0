Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608041;
	b=4wmIpoQvD4v6oy1MVtIZiKDlv0bl2ITISQXSTH55NnCOeUiDOfnLOse+eJRNCKWZdLcr
	 M0n7KH+F0WqFPf3tMFc8n8dyKsCeniOhRRwftwRJuAyW3dnbFfamwGXFdKl2slECZVrrN
	 l70dNVlt1NmxMFRYCrLnBj35sCqrQhovB7OKUXP2JvnDFQz8rfYxPeabYL4FMdFAMnrQX
	 3ga+58vVqK58wjp+6oLdsQyN0fSBKGBv4Zvm7tgyZx2eGvtDbD5LX1rd03Lq0ig51cH61
	 nrGbvdv+2mxXcbu0bM8iktn+SBceFeTJJMkbkkj1FGBmu90r4gBFcfB7L7+xBmIQg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
	b=ddt+C4VuCsOHjmi5wErZ5eV1ffqJ7vMA8WnIWirqsEUZAB1eFQ+xehV2ib0seNvN/QWi
	 eYND9i54BdiJu+WkQD7DfxcQtcfLKWR9z6fyjGKEyWSEkKl6k9vA/wBLUrdSvBu85u/+d
	 EQ8imp3UwSC+2tlldVqPRkKukF8vwBepLyG6+qNbntzPBhBp2Jj1A8cInnXhdzphVudzM
	 G/cTkqSBORPrjEXYYL1NLD+Q36w3ENVTnkwwy06LUd+wHLUqlmHBC+KsX74VJGCfWdqC5
	 s8GUb2iBSD7LdGZRbr73hYJ0iiVM9ouTTLwF7bOlOBAMGcen4aL7lJi0uIsNO6ZqX4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d8Hgoq7M;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E0B606A33E
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E0B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d8Hgoq7M
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so1706276eec.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 14:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608040; x=1795212840; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
        b=d8Hgoq7M87blImOSOZgL6idEQe9cWfKs3rUBu/JJQsSYqlkBYWB6/oSIN7hh8Eeg3u
         FSnMFwsdYAFi35vWHHXbdzW9ZOvuV+dgAF0XnsLG4AGy7Dal6oAm/95Z3IzpMAjAEtAD
         jovFz/hkGrdpvlgNCVKuaSWOSNbBok9EJ9F4+HBkP0jwm1qRc96XqoEjh8zOHWHyxmEn
         3TPa2tdNpZBronB/CzhYzbpp2WhWbBpY4sn5ZAHg7HSdyH/D8QeZwPo5gXLAlLSJP9KV
         8ZIW4tOev6Sa4gViptXBwZLY/pEd3a2jX+Mz7XyyQw/0xu4xIhOUCRZw2RHJ15Mci+r9
         kk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608040; x=1795212840;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
        b=tJlAaJYAlzXngGkJYbSpvK8375WN571uKpHvQogKZ0YzQfeyN6NxShzfV8+ylohES8
         rJxIuoaFtdJv6MYAUrNZYcOlCAS6DLp2Ibc9p4jdahX92zmaAvq7Oj3tWbrUpZNXNnuN
         xmytruVsaiOAwM61fJ2XDYLPv07oTIldoYNli6MeUX0yEUSHssY8JXwVkVUloLLdZsCw
         poW9peIuosgy7mcFr7e5S4M+vHtEIzgI+8jwH8J7U2aQOKvBJ1GZxM8Vx93IUcXpah1G
         Rn7dG2FxPjK9FaIpUXQfDQ2u2Zaeb0FBIzlunqA+veirZA9ZVMSCOno6D7yEwjMi7ALn
         PkZw==
X-Forwarded-Encrypted: i=1; AL+hErFeS3UGEHX6CKI346AgPwg3AWwUHafpiLzOab0FF1fhffVgeXdtKWM0Wu4zhA9VXKq0GQZQ@lists.linux.dev
X-Gm-Message-State: APuU4Z82x/JjO/sTVmQxEnTEH6vfNnhi5efKGBJr9OuSIR6rmD6iK9Hl
	9rharHxER8NPRDZD3Zc5ZihKNq/BI8FtQvKgopXi2jPAE+6K/gc1aQJ3la9ECHt/hbLyujM/ZMo
	Nefw14NhiKv+FLA==
X-Received: from dltt2.prod.google.com ([2002:a05:701a:c962:b0:1b2:3bcd:9068])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b88c:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5058eb73fmr2722892c88.22.1794608039776;
 Fri, 13 Nov 2026 14:13:59 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:46 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-12-wusamuel@google.com>
Subject: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

PAGEMAP_SCAN (0x10) and PROCMAP_QUERY (0x11) use PROCFS_IOCTL_MAGIC.
ext4 uses the same numbers on other files, so mark the row as a
conflict.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index dbe462040999..fbc3537fc9ee 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -248,6 +248,7 @@ Code  Seq#    Include File                                             Comments
 'f'   00-0F  fs/ext4/ext4.h                                            conflict!
 'f'   00-0F  linux/fs.h                                                conflict!
 'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
+'f'   10-11  linux/fs.h                                                conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
 'f'   13-27  linux/fscrypt.h
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
-- 
2.56.0.679.gc527c65306-goog


Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E13EDAC7
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232786; cv=none; b=om1E7a5vp131xtSiRM6NW0xwwatH34xWy1cmL7T+PJn8cz44RwjvAXqyu6o3KMWWx82jJX8Xq8OzHL7W4LFS9mUm1aFHT+babtDkhwetVwUDwf8+ZcTdvsEAT0idpnxtmk8eNVNfvXjEsvSqY1YDu9g8hEWt/f3k7wbzCn95aGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232786; c=relaxed/simple;
	bh=dx/n2ZSnVbr5KLV93z31YExmyUZ4EQEgGgGeMkJk0wo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jv5cb14jfCesc+WKktUQSAadZ5v0KEifd5Xfc+CtnTXHg+P8BgBiYWb1Lpw42fdlL/gPc/sERKbL73Y8K2nGVUfukbWAPND+dw7e2xMGf3DBGWSr20guFrWjgKFw9dptF0yaHKBXdraAw5sIFBeKE+mVvKI+L3JGcKI2WXdNQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Q376kZR8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Q376kZR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1770232778; x=1770491978;
	bh=xt/M6F0af0Aewj/HTy9bWBamZzfKiE3bbOG01o2uFtM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q376kZR8Pto71tvnj6n7GjgscdCs98sLMqjUgRQmz9oAx5a8WwuDDn655K2JU1/3d
	 1lMyY7iBcsrKZHLByNeh4kVrYx30qm7/xA/xsxMWjZajX5jn8vPtm410ZakXeZOLaw
	 Ze935eM/LjnMXgNX7dBQ12NTbWpSBCfrM8816cZ6L0oKa37a8AVJGSu64pldMMJjoe
	 7wN047NUvVO51ok7tpvhmhsiBOhrSJ7rlesDsanEpDeOK8wOsBfmN6xh76pzz8gpkg
	 zydmErghLTkxQgzLSmB/NZJttJzrCRmrWQWWN4hpag/EUbtp/feJsVr/CdHNp7YH5C
	 4TulsISPmxZJw==
Date: Wed, 04 Feb 2026 19:19:34 +0000
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v10 03/13] kasan: Fix inline mode for x86 tag-based mode
Message-ID: <2ee8abb956de90ce843a3fb7b971377887fe7a79.1770232424.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 4be30621188735452b609f7e3a4c7ebd98176383
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
inline or outline mode in tag-based KASAN. If zeroed, it means the
instrumentation implementation will be pasted into each relevant
location along with KASAN related constants during compilation. If set
to one all function instrumentation will be done with function calls
instead.

The default hwasan-instrument-with-calls value for the x86 architecture
in the compiler is "1", which is not true for other architectures.
Because of this, enabling inline mode in software tag-based KASAN
doesn't work on x86 as the kernel script doesn't zero out the parameter
and always sets up the outline mode.

Explicitly zero out hwasan-instrument-with-calls when enabling inline
mode in tag-based KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
Changelog v9:
- Add Andrey Ryabinin's Reviewed-by tag.

Changelog v7:
- Add Alexander's Reviewed-by tag.

Changelog v6:
- Add Andrey's Reviewed-by tag.

Changelog v3:
- Add this patch to the series.

 scripts/Makefile.kasan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..e485814df3e9 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -76,8 +76,11 @@ CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
 RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
 =09=09   -Zsanitizer-recover=3Dkernel-hwaddress
=20
+# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it to=
 0
+# when inline mode is enabled.
 ifdef CONFIG_KASAN_INLINE
 =09kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
+=09kasan_params +=3D hwasan-instrument-with-calls=3D0
 else
 =09kasan_params +=3D hwasan-instrument-with-calls=3D1
 endif
--=20
2.53.0



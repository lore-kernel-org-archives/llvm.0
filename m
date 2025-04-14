Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2323D2B0
	for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639890; cv=none; b=EmZ7OY1WWmSU//h9r31oTynlwmwtSnd0O+aJAqnBXa8Zgxa2Vp8FNYFw3dXRSHgrhiveGOvxsq/RM/3vE7Mzsf/s3QezgVZ0MoLHYlOVuWqzLyvwLqhWXLUk0NYIOpYju8IC+6G5Gt552B16BKTbXmPiUMCyvWK96ncwwVuCaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639890; c=relaxed/simple;
	bh=tEuPCZrbW4uGWbDihJx7L/LXb8gjOIKkMgf9s/m/B/w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l//rLd1FubW5Y6s+7D0to3J7H0F8lXM6Ov+YvAtuRkpAOZb7zZk6pB9eyavcxYIxLvnCaY9v8o7U/GuGY9P7DyA/BQlt6l8kiZQ2r6531oJ/1+rmI2258Tw0Z6ZzXuui2kt3nNs4Gi5r4cURD5/DNNDV1MXjRZl8tmchWLcDCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tgQwpAKY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tgQwpAKY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301302a328bso4282823a91.2
        for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744639888; x=1745244688; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rN4c8fNLuwFLiyiUAz0qlqS5AwW3WCou4y1O1Fl9+04=;
        b=tgQwpAKYe0zWPwvq0USxz7hLDH2yKwkSXFIyYD3HX6A6wKB/UVppzm6cAtPGc66BpE
         pO4jYTnktCmb3Lt6m9B0t/BV3L1hS2xu3lLjzmv3P6I7dlEzSCYMDx1jEcR5YPGn0cxK
         c6hM7C0ALZNm3/ZONAhq81PyEkE1PzXjnaCfzr8x2OOQH9fhfxtb8uyJfBF8gWC3n4rd
         BbIQYd01b/oqIdGwdjM5LnwndnSLrIdmLA+8YMy1D0RiDJyddN7P81QAeJrHWjdsJoeJ
         x89fFwIzjDXmP2Zu2rRo0fBkCjAyHz9CTvxNZWSzKnooiKjykK5e/dvzi6cccVmGE5tO
         GK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639888; x=1745244688;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN4c8fNLuwFLiyiUAz0qlqS5AwW3WCou4y1O1Fl9+04=;
        b=YJqF4Q3COLGobFLXKncMvKE5VcSmZpRDK0RDp9pADPBRNj8/Z4uEP3zBSZR1Dvo8CE
         h39Q483LuUDpGsUzHdmWHEKNfurknZRXI1H0z2f/G+avkPGt1IOHWGpz0A2ReDt4/v0A
         Ajr1m4/AeYGUbReK0PUUG2hfwAHbx0nE267dVFeUnx4dmeGwRwESxcB/E9BT8Oif6rvi
         iLi1QSNYSYU5nE5w/IxOqSskhctN7h0VJUJDRzQjS67glNFUBKfUrO8baRPZw0Qrv5oc
         YGvRqMwwat87YpwO0nuJSf6CvkETfIHsd1Hlq8RQWrL3pNkVNGV9yJIq3NDsYyqiVvac
         kJXA==
X-Gm-Message-State: AOJu0YyFmfi6IA/XLf5bgOAff9LsaQVYxTR/4fnFKfejcl+GoQ9n8tlu
	3LxnjdQgThrzLsg7LOjZl0V2+tIjqtx9A0bhwHi4CAwx8WdMN1d5U++Kb1Pofke6p5bAKFdcBSW
	jiwO1JlzJauqt5jDMXzy9b4wbFZuFVsSqVkpU0RDwsxZ8GUH2VaAxy7g=
X-Gm-Gg: ASbGncvZYTv0eyMpyb0VHDv3pX+kqAp+YF7zz1UU/UWSCiGVvkaTLuPPqSUKjhgvdhN
	D+Ut2fH8Yc30wXnYn+68/hrCo9IVb4gweNZvJyJntPCut7seBWsTo2i11ZW5ZjwmGQi5Vx4W7PL
	P5yN3aMsBB9gbwDv1nUfLfSlz7zgtrHbHAjQAfIZJchfpB7IcYxyo=
X-Google-Smtp-Source: AGHT+IGvcRdqaiufKsFDDDQaCGUwRsDmsPajuU91sQMLxAcWYm80/WD1jFGm+db3CQMcEptop6u1R1NHxXqb63usPvA=
X-Received: by 2002:a17:90b:2811:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-30823639c94mr17879078a91.8.1744639887495; Mon, 14 Apr 2025
 07:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 14 Apr 2025 16:11:15 +0200
X-Gm-Features: ATxdqUE88UhynrTms5J5w8VyMpN0utUaEsGYZOg0K2pAoIUegIx51WjnYJJGywU
Message-ID: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
Subject: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
To: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been trying to build a Linux kernel using newer llvm toolchain
versions (18, 19, 20), but it consistently fails with the following
errors:

ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property+0x0):
data is too short
ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x0):
data is too short
ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x0):
data is too short

The steps to reproduce:
$ git checkout v6.15-rc2
$ make defconfig
$ ./scripts/config -e X86_X32_ABI
$ make CC=clang LD=ld.lld -j48

The versions used:
$ clang --version
Debian clang version 20.1.2
(++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
$ ld.lld --version
Debian LLD 20.1.2 (compatible with GNU linkers)

Is this a known clang/Linux issue?

There's a kernel commit that addresses a similar problem:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75

but the error is slightly different there and the added Kconfig
condition apparently did not kick in.

-- 
Aleksandr

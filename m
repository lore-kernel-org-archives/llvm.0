Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203320;
	b=v79/LMQgugsNTkDNeenZBSJ/vVwMwMkg1+9PxhD6BsYi5tCqmXNb+GPGFVOKvOrnCYae
	 cIgIjYPGhcCXI8rWBujsJAmJJfL2lrL93yPpfaLWsOlnfa3mmgU1USaq1hTf1PEZZ1e8L
	 LmlJr7I5EHQNDHknazAqiXjaBxGjOL6tyFIF7aq9W72JJCVROG3nvADXfYGMiqhnBrXV0
	 FcfXZZ3Y6kHXwdtFDeK1kfhWaPY/Gt55pGLEaDQeClsyVGUO74BAnHSC434zugLZe+fX+
	 aqaTGx/6HGSZI9rfe82ilB8SQLE3VBQP6LZltIFGfpI4Q7ABhMUPX7MVXibCQr7Xq+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
	b=jD1DCQNNXvgTcaM/hp0zQrkzwVkcl64kDGqb4WjRipXeNXOdz52pNCbG7huwDXyeYzKi
	 JBADfI/OhaCcO1HDq0EvzrVlT6yjCgiMBMuCTU54kR+3zjeHs7IRC2QUpcpXTGqbMdndt
	 MR4x6WwDZUJs0poJZkszkfhRPbuZ6w8S1RsOism+I4Bn+0ED33u4x17AI4xhkgGDFVrv6
	 q1Zz8EQQSevkml0eW38qNxJwvhLHfT4D0pQxPJMiEIqmKzSL2LMPNyaXRogR4rgzpGI8M
	 Z7tm0Np4j0Jro0i9VpFTdS2lzmpqo24vodBU1uKDbT4LouE4nNdGDWgi85G1R1glegg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kctyUkYo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9919660A260B
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9919660A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kctyUkYo
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so499011666b.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203317; cv=none;
        d=google.com; s=arc-20260327;
        b=QzXgJwjSgOGafRcJkO8Rq/HfPPO19Y8wwW4AzZKksEv+TJ9fgWK4EUwSJUYbCwXQFs
         NFwQl6IcCumFXFWTlRvVPgbK/yPKCgRmmxXkhMp9LDURTKGy7eTbhw2mSoGr4CpxSwpf
         m+R1S0N9/qbLeatBsvALBUn2ZkqXCWv5iwmVfFBsK6BiLG+FrMEYxsZnj6yjEjyu27pn
         uspgamyUiTP0/1MswhURoFjACArTcPBGozpGWONZKbZgYhX/52okshRs7mglfQue5aPh
         XTPSDi4XQDjphJxifP+Cf92FGoaEXYBg3gwLVrX8rSdDhaWsdQisJRd4Uuf8PcO1+ewD
         MU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        fh=YGQOGhWnK5JDQ++HGptYSSSyaJ27FgYGG16TAd2Nvn4=;
        b=Pi80fXWK0voutyQ00svt/zv2R5thQTi18KI+yso+abomGh5k7kgB6Mo6C+tEa5OHMW
         pS0B0ufpcN7nsj3L8ggYRFmb2xYy39XBYek9zyEDWMXOyX5CK3Bg1Y6hwED7iGzybbMg
         S/ezPCZFK0iT6zxOFB7PxJhqu9XgB3dblL6bmzURZGbKtSm2diZKMEpFrDbq6mc1Arl0
         QPw/4Y9PMAwZ0SCHbabsho/6CykYFC6DLKZSxiLcZCxknAUssPdHqZXeyZv6hMFopkha
         QipkKRE9BGZp3E70NjuS/RPp+1nTSR7SghsIjvLaYwXsHM0KocCHSgReKoyNZOjS5/bX
         Zd6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795203317; x=1795808117; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=kctyUkYoaFedlW8d+FFpzDehkTxtH4laXR7MmmiyQu0yDqNputBc5yslTuljV+PXlX
         KdYQ5GA37v3uR2hB0mTGAL5IWT217tOKTey2fEpnU7JupkRXlHsp4W6UAIWsyovITXhv
         l38zn0UsgU6HeuQwtT2w5XdADQpy0yHA0CA1EA63LuGzgSezg2MpNhQR3G+zlw2V10QH
         vEu9hY3BMOFwJx+xu3Z1A5KZUmvvnYKMFmZou89DyxhnFDdPpj7dQAWptKYVDkr7tm1l
         +24+VMyTV4v3ncsHhCrFW9Eimj8PpU8j2+xbDVbUmdvj5azVP4Zz7YTgLHC5bSVbsHjG
         V6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203317; x=1795808117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=jq9lbB0GQRy8uOzkMASdETv/OOBeVZcJ8gVFOLkD8+kypDU3XIitBM664JBrpvzhSb
         I7jR8lwYdlqgo1kUY6lWl9FqIwDxpHX5JRRvrwbV/0DWDoc0hj7jQ0SGaAX+8NDbdDC8
         EOBKdA/AvkldkskiNSPWwQYdOCqCeEzYG0Mcknny7fVKan2MQE4Tkv74WxmTfTCue4VC
         v0yTPyZH4OmMXiu+pF0iqL9vXXQBrXinU+O3Rm7Uv7uB9qdh/tE63YzkJ9+2Tu9KTW5z
         Dwdvy9nDjqFbqFX/G7x9OQhL3cunXbVtdvxyf7sOGzh3kqZpYQUeXu8tjEE39udz5psV
         gq/g==
X-Forwarded-Encrypted: i=1; AL+hErHEe1Yncr/RaYRJIlynb7ol6emUlXJLjJEsj2ctqomjEBtQayBvuUXjiF19+Sek1/W7/XdL@lists.linux.dev
X-Gm-Message-State: APuU4Z86+Q5khaDH33IztgHs1gEVAWmGbqlN61PWMUByCZNkVSrdBMUg
	N1orkBpfeES7Pbza2es/eOJfqb1JcZoHzrCTPzHHFkrFm0aEDt1t2D3PTCs3zAj1j9gEoil8A+V
	jGo7TOIoFT2GaibmKPBFIU4hcdNDrFQsNfVsEfGNx
X-Gm-Gg: AZFdTZcdPU2o7SI2BcmoY0brS1WtpvjfFVkCHCZE2BU8KFeNY3NS6RwFBof4Y2vdqgl
	VxASmtBCWob66JpYbC91LLre/g9Xc91RPkFRQCq1Plm4IXP+6ikPIaVaYjPYETjJ2hpj6XjcALb
	QkKXYTrqxe+NXPICQi3bKWt/vf4FWb+5TMFmVCVOzol4PrLyrQUN/yHSjIhxuFO8XREN8oR2+L5
	iv3/dhzEOd84x/PXbDZ+Tkvz/5YSrptnr36/Cw39OiSmV1CD1cZXDbipLFqJYf0v39A7u1wpSL/
	QWCV8Sfh1pAzV0SzKUO15dfbZRJ35+GK8B0Xmjw4RM8jxOsffURGiYK64klf6AVU66bBRFibuC5
	Hx1AYn47F9dIlJejZt+oYmfbVixBLSmVDfBf9GKW6KJzU3tZFKk+N8Og1SnGUcr/dP2a/
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c51317e322amr590730366b.6.1795203316417; Fri, 20 Nov 2026
 11:35:16 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-12-wusamuel@google.com> <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
In-Reply-To: <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 20 Nov 2026 11:35:05 -0800
X-Gm-Features: Aa3M54pZ23SffgU83N8qfNlS7foyPp12zk6Rc2qBKf5ucMmFiR6202xmw20UsI0
Message-ID: <CAG2Kctri9R6b-_OiKcsabdBmLdeWGVY_zmpqqFgDHLKKCDDezA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
To: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Fri, Nov 13, 2026 at 02:12:46PM -0800, Samuel Wu wrote:
> > +'f'   10-11  linux/fs.h                                               =
 conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>
> Those are PAGEMAP_SCAN (16) and PROCMAP_QUERY (17) which are already
> in the tree. The two ioctls this series adds are 48 and 49, i.e.,
> 'f' 30-31, and they aren't registered here at all. Please add them as
> well.

Patch 1/9 here only backfills the existing PAGEMAP_SCAN (16) and
PROCMAP_QUERY (17) entries. 'f' 30-31 for 48 and 49 are respectively
in patches 3/9 and 4/9, where their functionalities are added.

Patch 1/9 is standalone, so it can be picked up independently (or I
can resend it separately).

Thanks!
Sam

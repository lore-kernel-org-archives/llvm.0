Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802197;
	b=Lud8ojebKtocUOK3sVJ1lIvXnxQtiCvWeHfXKfiKnzKs2mpo5hFsHkinIq/isfMptKZo
	 bi6UOyrT7ywRst7ZGM60KtEyrnCyUCfnEq3YZEHM9haTPguhcN0A8sDGOioUWsjBkj4kE
	 UiIqajQ04V8kyZOwuc78hrmrvorsqqoRkMRCT57mDl46cGMwzQ+UIJJR6R3d9WxRMZSME
	 mA0MbwpC4+v+1/e9yYQkPPpfV971urwiiDR65IPWUgRbVO+nrKyGKKSK4Bt4D2WPXUOI1
	 KEBxyvtEiWaoROhCC06BRjVQyD6AoucU0CmNjbCjk+LS0Tfvedw3C26m3YWca8Z2WJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
	b=X/0bQnBwfE8izc38tAns91ArxdfhT44+IdpnGfZzIgCM+0qzejmUjAeidtTLc8IVGxXv
	 n31J61WIYjoyfJVhSC8qSGxG32S9pB9C8pPAP9hP6McbGvFr7zuAHXjzQ/1VvZPuNCLnD
	 fx6u5FBEJIBYSLXNdBa/Z8SqL2/ygX19R9ka1dCjTx0HPNFzWPnWu+Mhq8lur2xp/Ma0/
	 s/MfRIcpMe9E7rQhXl87+ow78qWE2G6Dzb6qzUmUrCv/Dk2YeQDqyD7bLkjJOM9z4OAUf
	 ccX1U+ajFfgl952XyOEKcCbLkRbI+8unCtURic4kWP9GCMPUDA6fmi4liSrd7XSjs0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExR3eIw5;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB3606A32F
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 14:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExR3eIw5
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7005935e9.3
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802195; x=1794406995; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=ExR3eIw5EOTli+srsUtESfKmIBbiL02jZdO5DS1cQCPgL4CJpevYIo58PLmNjYlktE
         SmrfhR9JGyoLMOtzIUCvSdG/qwXigHVP9Z1BKVRVokUFi78vKHkVOmra//Y8GXUFJICx
         FhuR+y6KY4aVOWc7jrdJqShlamlYmo9rYrQ4Mx60f+SNcHA/klm82vh1k3JANOQqtiDb
         uIGJp++SiX42CeoAn9LpuHUMfRb3KhwQ/YLBzvu7nAXcQ2sE7b1TZrWngrc+oCYzmmL+
         IPlpZVyy3G4K25StAe4fyp934X5QEcoyxH9B7N6j2JBUe4OnaAubvrDcXT4iisRmEssi
         Jb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802195; x=1794406995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=ldYbDH+JtIelurXozMofNDkGzYEjDHJalvDPMICra4UGqsPfGKT7DOtjjsx1mTe/fo
         556uP4RRH8DmYeTOxKd4XKW1V72/SAhg5Pa2SFNKFijVr+HQT5NMuTl2/h8/0T8iy99y
         A3uJ22K+eQx2nstKL/wb7t+yEjBK5A/ueUYO68tV2HD/v7eC5Q7o2WVJmb1MIZ8s7//x
         cLW1nZzjQf5T+mXhLSu0tuEXsuV2gwhkUyfAQQdWh71MS7Rljl0scrUYe8Fc94EK2c9o
         pvyf43EAhRs7Ywxk0DOxtsjqD3CW4g85gG/ekkS4rbGup3TRaO5zu1G+pahXlTltqjs+
         F04w==
X-Forwarded-Encrypted: i=1; AKwUvBy3Y/586Ns7atRYaYNE4r1aN/p8mAgJeAtqqUAKpA+Ebeme/Le55uzcblzzXd5nhR7dEtBM@lists.linux.dev
X-Gm-Message-State: APuU4Z9fik4JLS2KM7zOLukSHxFsm7TbFysbF2TgxsyLAsFoCsAXcE+N
	isdk7M/Cx2XqzdHaIzcpaq0LzmChLxScx1CBhHhpIGeCUTcerm/6A0uL
X-Gm-Gg: AYBFou0v6PAZ4RUUC43NcAFfen81L+4kyh+qa8/QsT81GMJ/ZA4Vh9DCOTeJTrs55VL
	eIzF3fTrDnGsHPQ3WupfcNLiEUFcYFOesfJETtJVSoggQ+2q5kqDCiprJiaO1KK4auFKPTpDa0Q
	I5ahwmqD5Lxlmgwe8t/96+pyejblzxBCymFc4e/Nl25WYaU72wUiTlse3RtR7OjbDtv+7s/OWg1
	+efRqhJDq7IO7blBfk7HOgP/7fnJCO54nm+R3Xn1kzxttlw7qMNsToEbkCldRqXAOJmehPMeRJp
	rCsQc53RWR3zMB7syqYZRNEV0gXPTopD2JdAWyguufvPe5NVJ3mVB8odkqkIu/7wYs+q97zrFc2
	SsR0hAcO63g1E1vjNUJWHNOzzcFpSIfsrPscfXT+ItEdaeGjD0F+/vLG215rjR9uIMOflNbsEH0
	V2AcISbosciUtUSENAOt3VO6GF9vhQk0iMMyKXOomeHT7wiQDjnty48izE6VetsN1HyuAiqa+05
	wowX5KEgmWG2CGGScXp4li0kzu3vWcNp5YZkbAfGHdsAb9AE+cvyTPC+bGbK/wXBT+i12yYVzvj
	GB9J4P6NA/UuGrGLEhMGM3Y3kJe2gh34lmBL7dUWEFQPhc/G3kGrzxXVSHN+UfUc
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr406397685e9.17.1793802195353;
        Wed, 04 Nov 2026 06:23:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c7480e3sm87089165e9.7.2026.11.04.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:23:09 -0800 (PST)
Date: Wed, 4 Nov 2026 14:23:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261104142307.431fc12f@pumpkin>
In-Reply-To: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 17:14:26 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Oct 2026 15:05:45 -0700
> > Samuel Wu <wusamuel@google.com> wrote: =20
> [...]
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here! =20
> >
> > Only that the user might really want one of the copies.
> > Sometimes there is only the copy. =20
>=20
> Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> pagination to cover these. A prefix query for "foo." also finds the
> copies when plain foo does not exist (expanded on this in my reply to
> Andrii's Oct 30 mail in this thread).

I'm busy rebasing my patches - they got stamped all over :-(
I should get a v3 that applies by the end of the week.

I will add a 'prefix' variant for you.
The 'next symbol matches' flag is exactly that (actually it is a
this symbol is a duplicate to avoid issues at the start of the array).
So in this case that application would always need to read
the next symbol (by name).

I think it might be more sensible (less pitfalls later on) to return
the symbol number - not that of the next one.

David

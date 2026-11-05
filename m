Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793863153;
	b=0xdgNnUUqzGTY7o4gIEz0aJ8xhMnqn/wIdsOx/VsbJpi8M+CQoekzE0M8hedjifVXm4c
	 mtucp41H5sZ4ES5h6g5usrKHc67BoxU7tKC9zl9cxoofbFpD13Mo9NTvgm34Bqhi44Vif
	 YT54JejqMYjJRZZF2/cS7nATkyleCn7lLF4ke56pJmzRYuO+sNs1KpRmPDM75eRkDT+t/
	 LD+4MOubS3tnD+u9pZ3PU4CLw6DcAHzTlESO5qeb8I234j1gr+iKyyTsnx894Jzz3E5Sv
	 a0nvcNm0vDZDJmtg8UGUdoUIPQUDvgKiBQtUla3Q3db8Aqv7IZt89DjmnwASetBPUdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
	b=SU5D0Wa9TXwcx5BxMyEpMYvkepYOwbNMDF8WBU+phw1c320levIZByvWURGyBwwAfYX3
	 kusHw7uyW5vXpo4j3Xz9z8eCLlNdtgYNekQZZs6meSfHlvtG8A05ZqS7Wt4IAbhkA66mb
	 h/IYBPgMpBAZSKMl2X95WYfLTARKOLTF6s95QuPr8wde5yftX260Kz5VF8q+BgeUpnElS
	 L4EFoTH5KsSCmh4z/aY3RFsJnk42RIU8Wtt1i01oLflayeocELamzPWXZd0TteQYJnIQX
	 U7FM8Z9X5NAsWy3iwZ8HpHkhltJ7Nw3Lsij30WUoCZoNr4OHcExi+WzqqwcLbnFAVWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8sPzhAj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A5D606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 07:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A5D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8sPzhAj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso42884eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 23:19:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793863152; cv=none;
        d=google.com; s=arc-20260327;
        b=HMEkU6Y0u0mFhwpFH/w6KDhLHWeIWIumQYJCqtRHo8rgtC41tEGjh73P3K2VTjnZCf
         fw1WOHErPJyqUkjVaHOMLWs1uAWkHMoEM/Uth5YdFX4J8pQ9jnZ/WZ/izpX4UvraS0S1
         1ZDLbRp+PN8nEp5DZAzzNVOzM2aBJ23qT6YqM6knG5yYnoIk3ph51WsE5+mSNCMrq+yF
         6OBaeI5OKIKsqTJFG77qpzD5GWUb+9UEPANEsWToQ13oERJIqYUjRhUmHsSzHLIWoz36
         s9pvOdRbYAUZCg4MwtSVIuFDpIWv61Ix6+3k2E562Ket+HpcwCTnYXh8YH2eQSZiSjzp
         eHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=nFLjkuh8/IoSsNN9fCDH9zHu8bRPJmWoPDGDvuPfJux2pv8GU10Exev0B8UBx+iWZk
         r6d+5FLmIZWZ2IUdnUBC6Xy8+qPdMFC5ZAFo3a/gWBi81ubIH48iI4Pw+rRDlSU6Ip+1
         R9Y/Wpqp3fnNetN8T+M7BYU9ZMN6+6dnMUMoJjutTRVtkuc+xDm5Lt1t/b2AJzqZ4uCS
         d8PtuuqHiVhNwp7Heujg7G4VhoB753BTvGP80bFndNjcUzvQu+jFT9Wd2GBaldo19uB5
         RUkmElpgv5QXFMtAcFzvK3Ly7/tmI21RZCsTEHYJhVYi0fQZbkBY801PBudPy/6kxW3B
         5UHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793863152; x=1794467952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        b=e8sPzhAjdtHhZM4EKaVDjtyFS6FH5tOvm3peiMxCealmcF5ZVQjfZWqfn2f/zOI6G/
         R1LqdDXfJ9KigrT+KNm9Kqg0yZl36aJDobS7fZVMCbJprmbOAaLsgCUNQGSou1WD0mwy
         CILAC2rH3D5ZdVPdPj9X6uE6Xt/FUE8HgBU4U4YfqAG3FixAb8VgJNjaRsG48VYFx6T+
         eohWb/FEBAHopLtzuBsUueHRvHGi2XPbLaxmhoW9Dh/Wq/QEYJufgQu3/mMQVf8LlYwJ
         vDBetIL64qXqgnXwj9mTShnsiUHSgmWRor43mlh73bquiFK8Jgg15NwVnG+7HJsx7p8T
         BPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793863152; x=1794467952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnaLZPxbC7a/t0yUTKESoDh+CYxVLsmOBjx7EGuaz9I=;
        b=jWtUbzDNJS7erfKaSOsShH+GpQCUK7IN9k/qThcpOmhOl9MN8kttV77XWWWfePbO1B
         t9ercJZYcoawEdUY9fy2wJPU3HudYuRKJrHYAV9beGOm1UKUnQKIYFaczfH4hwCkQ5Mq
         fbmWBMia5DvbNMrOg/qwRd2q/QmKvDVIFrD6bVcSxA9qtoNZmcBwZ1GIiId9xJfKEkk2
         Xc0ITxVvdf0UOY8P1tp1oAZf8fRKTGLqwa9aIXnkfvw4U1ndcIkPA2OPbNqIflwwxKai
         Zaq2xIu6++vPEn8Ib1DTS5/nopIssldDU8UPW7WrK9kfWFJirDhyEewZWCDF1oY6l+fm
         5z9Q==
X-Gm-Message-State: APuU4Z8F7WJiXfVaRgtVCrBn8G5NQziFu2BarrK5rxc4DUcKtUN0US3g
	iaIgKy+YT6NKFN+zMldXBDMlw8M+bR3a1iKPupEFULnXO/z9qfntflOqxtugIzZBDgTuGHxDoJJ
	UrTL20c6zge1t26MjcJ833IQSTEFdA6LB520z
X-Gm-Gg: AYBFou3EB4GsapsMzyYaF5bmZL7E4EN/WeFdCxLzwTmvmXNyUGNFAWKx5Fu1rmlS6/d
	1X30vJL7weugKdncV/1GBPf5jzWbi6Vqb5lsK53pAAlmP0l1bzSLD7UEoQqwAN9l0HGveKKYRHh
	BYDtirBKqGeuRps8mvKjuHeY8ydDYtZ+fOqUWopAnO+62v8B7QdbN0KcLUFWHVitvtNiRegXf1U
	7CJIyITm308tphQ3He6yx6Cw6Ufkkva/ldN8xjDw2hM2gNN4WoW/JQfGfe4v3kyYhlLQBOBbXag
	9eP5EPmWe9kE56EQRmcniDZjBqC2xt0PAuG2ELhwR1Mt58dgmdpWe3cmyGw8LUqB9WELlIt0tm7
	PiFfpBrzTStondm8STUI8RR6Mv/UdZAY/Ko0i0wolFojnvEmq0x2eJPZ8yeiFIIXW1WaLeW6LrZ
	8XzNixxo9CVYhLzl5i0kF8GFPharXg5q4m8D475qQ3Is7aQB2HSHPCFMlG5pjUVr8J+fdgN3etn
	OLFNLdKvh1saBe7I+2y9I7sUkzmjaw1N7w8
X-Received: by 2002:a05:693c:87c2:10b0:36c:a1bc:6114 with SMTP id
 5a478bee46e88-36ca1bc69bamr11080977eec.0.1793863152067; Wed, 04 Nov 2026
 23:19:12 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104020009.GA999555@ax162>
In-Reply-To: <20261104020009.GA999555@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 08:18:56 +0100
X-Gm-Features: AclHuK-jaNt67HW6FfiVCm7PXBmxx7rZN9GM4g_TqRjcMsIJVs_M9vm1fKTDwXE
Message-ID: <CANiq72=cB+J6AzxFJXpYgX113Ly1bCU1xbxuG094aP+FeZG_eQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 23.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

Looks like it works for a couple Rust boot tests -- thanks, as usual!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

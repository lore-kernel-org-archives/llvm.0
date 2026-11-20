Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795194980;
	b=MA4m2HYNq8zkuDZxf0fYXz53Ou4b8CzaEdnUJC0buI/8rqWjpoChxUuvS2jGsofc8Y16
	 0vSfnuAJJ3ENxdduplzHNVRazsnxPEJutAEAseqHIpzLxeXYDz43+1wJbRSEdI3Y62NRL
	 +BtzMliVCX/UzsgaMUTp5Y224mRJyoGDNT9YzN8D/Qyjrp+hhN2N4NMAiTfUDiBwzuMzO
	 HxzyOhSY3tFAVi2jBwoD/afmTVHQv80gNlq9mrmOkqV8P1fuyUm9G51GmHMsAnnRQzW0i
	 HhPu2IIjR3bssVQmWTbEP3GiH4Uva2IkGrO82d7zJqY4zwbLZJGLbjDtuaNtpuPWe2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
	b=aRi0la0oc609VKtRkK0PdTn+5/it9IGeDmwH5bOo34CPz4N0n7bm2HVwRvnhQot3/+6e
	 gF2rmQKFG7majaGzD4NcITWFCgDZ5Tf5CMNRpccpj1cEss4B4FjcsICVSSgBKFGgKZUS1
	 FsRzqBK8uG/gG01a7v2hNSkOpAhgXKzLJr+JIsQC7coBaGFOPm9868g+4ViVj0omdqtz9
	 6r6ivht+VQ7ftrlhDWcyvrMGimeKk3OMu2V/FpBYP07UfBNDi0HNPPFHSx5xPqUszQb1U
	 KwVLox2rDp1GCf0dw6Iy0SIlSwmzzqw+blpBUW8n1eM1rpJYUXmb6zafJNvQEVCCThg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nw1MRkCB;
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FB606A336
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765FB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nw1MRkCB
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55be673e029so300981cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795194979; cv=none;
        d=google.com; s=arc-20260327;
        b=LWixmQ39eor29m9awD7YgWxk66RB7PeiHAFZl3oRMpYqVbZff8st9rP0rQgHrjUx1n
         xSMWkz7aGVa9rdPpasF2DnXYQa4VmwoCH65kOzSprwPGGv0+oXWGIluFjiWsvJN6+BB3
         maqFxQUSNFZ0mU8tMTrhlxPCAxP2I5V2/XR+PQlOGz/E73yFlnBIsn2aMim26R5S5+jH
         FiRVGeVy1mvLnDDJZ6rQ4R1i/XHHM6m5tefdh+W0L2+el6Gx2Z3SGR553WGMzYw1m8Y9
         pHmyO+U5nhVlVXpMJOMCRTqhsM4Eco8LQgYOXi6HnseDlzU66u765XzBEb318HYE7/oO
         5GSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        fh=yslAWE8bB2y/T361hpy0T+NxSqOHiqeHwC1NpmtUK9Y=;
        b=g+Jtur6G/af+I/tVCDzF1/pflXc5sAgUTCUfhkJGdHeFXvV/3fyGi1gWwhXsHbtX2i
         Vozjozd2JmI6BA82xTLqA5iEqKGdKPWBW/yzsj+u94Ng9/oaR/6XC4v0nwikwhgidOzb
         RYA0Jc9J14skjgEJWXvk63fA0oQhALJGDySSYjCEk8se9/YgvXzYCrAFk21Z7ih85K7l
         pogQ1+MDAHk44gOjlnTsvQwyWBmLECEz4TBNIAg5aNoylcQG1uRDce7N2iv2HRUzvfau
         TXAfgABQOySUOH1hqWkTLJBePO/6xT77Bvqp3zdRu76sZ7e3IiHOQ1Dodm3WVV1zzncG
         cPIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795194979; x=1795799779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=Nw1MRkCBpFQSLJTz1RjqLHsuz9JVBzu0uwzRvCTs3tYtqx1oIYStiyEnAOWJntgTMt
         qsG8mQGuzxS2AwmaAHQAEZASOEf3tUNjc+C7mLAvSW5tNftn3wS2h2oUbDK7OT6pD/ub
         ArKCU07qirbigkQRXHyS0DpMMV9Fuqs5TL0Oi5aFoQx/w94mwSxG391SpuZOjbR3Y6TJ
         3dMpqcD/x2Or1cO986j3F33TD5TEexs3cjfgBfkD4UbacGmdouHl1n3pF6Up0Z4Db1+7
         XHomBxlZ9u3p0ZERloPU5xZz7rUe3zMmSibNZULc6BRL8Gdlkxj2gVoi/BOHlYv2gX97
         qVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194979; x=1795799779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=wYNSr51A/0hMEHKiJygznkCiyAgaW3bEfi/VbZqFTHNY37Lq1Qot/Z2nWt0u8QTVY2
         iINLpRJMCe+Rg9iIBUgWc5IXlGuxOdl1ocS3MPfcSjqwU/QabCF0euCG/CdK4v0kTfQb
         WRsSvZXRt1P9JYzPYWb4PAPegnIdEkwkhlFveLffde7zRMlieDLluyzp1sVoyT9lNswX
         N/pf1k3BCOSzcQ8jUuJ5FqAD7N8nZiG1fbFIRopgkenkuB1znpww29mVZl8NHzCac1E+
         6Si/DeJKmBe2322pO/+UoDKtOx/h7xE2a2t9YM9cqV5LeMdhLshPq2pzleHXUEVOxSXG
         vmVQ==
X-Forwarded-Encrypted: i=1; AL+hErHwzHCtuLcLvX81K06v1rLJO1PPpW8INbapEFVsNTalWLYdiXyN+9nN8N9PzGepG4zPBS/x@lists.linux.dev
X-Gm-Message-State: APuU4Z/4hR5yNkS85gKEOIPFIyjA5BnKO6Ltc5WH56Ru/DKgi2bvZksM
	4daIg+lggAIY6lTezFK0Hxv0qMDVW+7OMyzR1COtO1qQ/4gcy+WWjX7ieOkyPtisj8DiruuO5SB
	3QvZKvuNsMWuiO36RATKYPfcV8eIY8zmmJG+o/ugS
X-Gm-Gg: AZFdTZcJEdn3DiWkAPSsvRh2VoENJXMZMDvgbRb+jGA2t6BPfi9p6uPo+gZJlYkVAYs
	u+OPLRSID89H5tJNzdBdQIdnJ1AZhAJQp1iR6zSA5fkMAuOWW2HlV4K3H0htmxCH0wooyW5UQsW
	GwW1zfjZNyNpamuhy9ezApWZOtcViXfnZBoBQUzJFMAibdsDN6nj+MCyFUKZgPWyzMEC2ymACuB
	BjZo+SgzyxWtZO4udNgSFlqgDI2euQAIFEg1MkzzjitoWZj59FsAQzlffUfg1N7B/5BzNO8iET+
	QQT3XwVedsFUGXu3T/8pCNjqU8BUAGZZblqVBBSkZQSp7rTTdS7VtkifF4NxSMy85sV/y+WmESd
	RflRJBxvonkh6eDgDB443Sew9jjrfqojNoNYP0vv2zjeWG7TDjIoz8O510A==
X-Received: by 2002:a05:622a:5145:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d78c75bfdmr24228621cf.0.1795194978630; Fri, 20 Nov 2026
 09:16:18 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119171021.1535172-1-irogers@google.com> <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
In-Reply-To: <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:16:05 -0800
X-Gm-Features: Aa3M54riczv_KPXhd05XtH3JpnS1jtD7HRpnVfSKMpo6JVR0xKjJT_2YvUjV8_k
Message-ID: <CAP-5=fX3AE_XyUbiZx+7umZGH0ER_hjJwGs+g+Afxk4A8JuyLA@mail.gmail.com>
Subject: Re: [PATCH net] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Nov 19, 2026 at 09:10:21AM -0800, Ian Rogers wrote:
> > In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
> > return value of both tg3_readphy() calls on continue and never checks
> > err after the loop terminates. If MDIO reads fail across all 10
> > retries,
>
> If it fails 10 times, the hardware is dead, and there is no
> recovery. The best you can do is make the probe fail.

Agreed - propagating err out of tg3_phy_reset_5703_4_5() does make
probe fail via:

  tg3_init_one() -> tg3_get_invariants() -> tg3_phy_probe() -> tg3_phy_rese=
t()

rather than falling through and passing an uninitialized phy9_orig to
tg3_writephy() (which is an 'i32 noundef' UB in Clang -O2 IR when
CONFIG_INIT_STACK_NONE=3Dy).

> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> This clearly does not bother anybody.
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Fair point - sending this as [PATCH net] with Fixes: for stable was
wrong. The motivation is cleaning up Clang -Wconditional-uninitialized
warnings across allyesconfig so the warning can eventually be enabled.

Would you take this for net-next without the Fixes: tag (or a minimal
'phy9_orig =3D 0' initialization if you prefer not touching the old
control flow), or would you rather leave tg3 alone?

Thanks,
Ian

>         Andrew
>

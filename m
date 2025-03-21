Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FD230BDF
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593435; cv=none; b=dBtfVmvZG7/HkdxwUnuxok/SXRpXWe0RJeojSZbx8ir/y+xUgOGce2sX5zz7XEimDVhxDgCFQozEI/Y+136Sy8xgOHNeXuVpU/GhLE5AldJuppxBOrLrljIhtGXKSa9BRZShmGac3a3WLVS7uwjQOsSp50hLRYFR1nClISMsZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593435; c=relaxed/simple;
	bh=L6SJzLz3ZHsbGmHxGldjAhRkD/PLoIDEr7kwiukuZW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekcNwB2h0qX0fk70tH/4veq3xEKcQESW/eub0VLC6DH/9cEx6FXUf0U/+DNFL/EuC6QLliRioam8h3nmwB5MZ5PQL1CHwfD6xRsCL7W+t6MUdRx/l4+kOkaDjlTlhKoECr6BXEh1/QUDi9mVnWMgEbDkxOR2uuYVc4eMbZcOoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AUv6Z+N9; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AUv6Z+N9"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e573136107bso2387168276.3
        for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742593432; x=1743198232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REyftnO4MpLMzJPBIeESA3ysE+wlnss+4em0CBGNgTQ=;
        b=AUv6Z+N9rosuEdXrZutd5axjlh8NvxsYY5STS5t2pnNUaUrFoUOPy5kkGntF65SzV6
         2Bc7NeX1Dk49+lHBUWupbBmluHgSOoqRI4K3NF+AZAt4foBsqpld/blLENCKBpMjEd3v
         d5bV6BRZzPyN0izIFBZGBoyaW5xIcUmDibGj9XObnkPY1S70vrTy0GlR3zUVoC3XGiPn
         JCFi/7ylzaC21Y3VnAmu7n7oZTTbGtqjQVdXvSMlieO/oUS0icqR1i5foBm066XTJyDn
         WoSDo3xv5BfyIap/85YNMAHlLit5Gkr+TTDtaGOJcjFsrtIrN/4N/taJUSHowemFIl/1
         rYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742593432; x=1743198232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REyftnO4MpLMzJPBIeESA3ysE+wlnss+4em0CBGNgTQ=;
        b=Aalr4v7GzsnMGk9cWyNKe8aG6VnCNGxK2A0jByByhTOdM38hwRwxC6kEJ6sVypLlcE
         UnAA0Y3CX0FXgSGLEyGFWEWsfnZtF2NOkqD53lUovduBsmXVksXFQToOXulvjTEPOPMh
         9crKQEWemiYLM0beltfLabziH0tqaepRMVPgGNjUPcUm0rpPHanVs5h9znBy84BfHqEs
         /maHA4psRR9INqJR87RRkCnraYYuQ8Cx1xuJ9vuuG8LBLc9I8SOmc4iOFhRaMKxg+vpb
         HemLseRUA1d+/r8eJCRaO70ON2SwPinxjP1ph7MqNWcnhcjpDPk3F2txiCYxq6UHRLdG
         SV7w==
X-Forwarded-Encrypted: i=1; AJvYcCW6Xr8tbMyl8y/2j3epN8iG6VFnhn9lvs4BlIP7lSjwseGrb24NDR0mo/AoFHPQjGxKBBCR@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcuo9VZTYcLra+U/YhG8NfYERneDQwDvC0dC8bVL+SMQ+c2nwg
	jO3Oh7XyRWcYN6N0LaD2eoqlF3mFM0NpocWYadrV8Hyv0srxd2ZOtgYFB7jjh4f0mX5ruTFX3b0
	AXY3Qh7gCYIfqI2vn/Scqt+Imej+3AqrqlDki
X-Gm-Gg: ASbGncuj0nRAjra7EV/JzT3hYBJaXEe/T28xP45eJuEbQZ1k6x5FWaYx8HFygAxTCUA
	tIiLzqIyMs59P5i0WfNTMl3IaoLk1Lsa0QuwxTAJ7v5VMLEsdO5+f7jTzrT90qROLT6L8n1eKK+
	qc4mTAwQpzIMrHr8oXsuZe+jpOhg==
X-Google-Smtp-Source: AGHT+IFhgDBVmWXOeUx6TUA58CI2V05fBEx4cashmyHcm9tr6dKV8HHQqh2yAD735f9jloo77ntcLNZlqEMFIu5HtQU=
X-Received: by 2002:a05:6902:1584:b0:e65:c4be:6faf with SMTP id
 3f1490d57ef6-e66a4debdb7mr6842789276.21.1742593432251; Fri, 21 Mar 2025
 14:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321164537.16719-1-bboscaccy@linux.microsoft.com>
In-Reply-To: <20250321164537.16719-1-bboscaccy@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Mar 2025 17:43:41 -0400
X-Gm-Features: AQ5f1JpI85RWt_bAx7UPP82VU95uOW2DFn-bKsLOFnqGS9WmBCQebXEYShkzoyw
Message-ID: <CAHC9VhTb90OxDKUGPYKmQV6faPjdzkuqE5COnWzuub8Q4otZaw@mail.gmail.com>
Subject: Re: [RFC PATCH security-next 0/4] Introducing Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 12:45=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> This patch series introduces the Hornet LSM.
>
> Hornet takes a simple approach to light-skeleton-based eBPF signature
> verification. Signature data can be easily generated for the binary
> data that is generated via bpftool gen -L. This signature can be
> appended to a skeleton executable via scripts/sign-ebpf. Hornet checks
> the signature against a binary buffer containing the lskel
> instructions that the loader maps use. Maps are frozen to prevent
> TOCTOU bugs where a sufficiently privileged user could rewrite map
> data between the calls to BPF_PROG_LOAD and
> BPF_PROG_RUN. Additionally, both sparse-array-based and
> fd_array_cnt-based map fd arrays are supported for signature
> verification.
>
> Blaise Boscaccy (4):
>   security: Hornet LSM
>   hornet: Introduce sign-ebpf
>   hornet: Add an example lskel data extactor script
>   selftests/hornet: Add a selftest for the hornet LSM

Thanks Blaise, I noticed a few minor things, but nothing critical.  As
I understand it, you'll be presenting Hornet at LSFMMBPF next week?
Assuming that's the case, I'm going to hold off on reviewing this
until we hear how that went next week; please report back after the
conference.

However, to be clear, the Hornet LSM proposed here seems very
reasonable to me and I would have no conceptual objections to merging
it upstream.  Based on off-list discussions I believe there is a lot
of demand for something like this, and I believe many people will be
happy to have BPF signature verification in-tree.

--=20
paul-moore.com

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EA2368D45;
	Wed, 26 Aug 2026 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765360; cv=none; b=BwJnnu6GTNLXIAgyeo3SNBqMcFV1pVfEkrzek9sw8z8Md5jE6jMv0v3dxathoMoxAcmz0Z7TkkeovhfgCBXGYKTODwqqiP1rwUDiSfb+v7eXR7F+uJS5WzMq32f35HW67o80vMClKcuUgAWibSvRK1iGFXdGywYwKRhxmmB8EXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765360; c=relaxed/simple;
	bh=iB+5sc9T4COsMr1gJDAfI3xRcBASZiFVpi5Gjpi+7tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLMye51AGptuus6E8uJFrrnk6JwOc0Chhn7qt9copdWzDvgpvtzAmf4NZZwt2cmYRf8GC7BVtnPiuqb2SHAT0Ee0h1T/qtpUhxwdIdehsZrfspmiWf/luMl5MHPbxexokRrErO0guUfPRFqIqp+v1a6jJG6UB2G1bB6fbXpn0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BOjl42VL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BOjl42VL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6kvjk25rvX43dVhJ6Zk3JZPWl7hUKkWcNDJWv+5kpek=; b=BOjl42VLN9ObfdI+7XMrnqD5cV
	88NXPu9JtsCP3xQzyw97dFMmboDrvhWFgUXynYKVtLFKOzfUvHBHL6yZgWfY3rdYJyDVZqQ90CltT
	NlHkyeohACUaNJptdtjJYA0s5jFwwcq+9DjhmTzZF62JUC10Eap2/rYvl0x95OF1qjV6oSraeLKg0
	DucId+LcouIZSj98IafphU6RC0FZRNy+yqD5I4c21pbDv4mmBluY/n215NSY5VCnr0hhlwbyYsGyl
	vibRMHHGReiXIS0Jun0+fF0NrEkTozYJcdPA2hlCng3g/VoCWYqj87a5XihWwwYCX9IR10Vtl4VA0
	LKp9m9Ow==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHQf-00000002oku-183z;
	Wed, 26 Aug 2026 17:28:49 +0000
Message-ID: <b0251a55-340d-48e1-88c7-e8725e84f10d@infradead.org>
Date: Wed, 26 Aug 2026 10:28:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] Documentation/gpu: document the Vino driver
To: Mike Lothian <mike@fireburn.co.uk>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20260826163913.7052-1-mike@fireburn.co.uk>
 <20260826163913.7052-14-mike@fireburn.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260826163913.7052-14-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/26/26 9:37 AM, Mike Lothian wrote:
> diff --git a/Documentation/gpu/vino.rst b/Documentation/gpu/vino.rst
> new file mode 100644
> index 000000000000..98e82297a82a
> --- /dev/null
> +++ b/Documentation/gpu/vino.rst
> @@ -0,0 +1,254 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==========================
> +Vino DisplayLink DL3 driver
> +==========================

Documentation/gpu/vino.rst:3: WARNING: Title overline too short.

==========================
Vino DisplayLink DL3 driver
========================== [docutils]


Extend both the overline and the underline lines by one '='.

-- 
~Randy


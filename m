Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A543E9FC
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771940; cv=none; b=c/RWvzVw8wLOf7zqDRk4XFZ9+4LgKRkgvKlCqWYmmoUGrpAMddCK16nZNPu75Rwf6vzTBOyor1odTnqIM51rgGDXJf/CBZELCs1+jnTNiY8l2K8pnAEMJtg5OUEXz3m0DwRhiC6PWMRnRoQ3WBPoXA0zcstRgpAAjvvYTqzPLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771940; c=relaxed/simple;
	bh=Fzi5ANYeX9FFNpk/BMwZy3bmirTTtD4/9jhTXqNFNqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcvE2ZXu63fKtvAu10Q2Diud+YocRMd0fcwO5VpdyBYQUjivwfyJf+3gXNd9KOr71A3kiKwf907j23zXA9bBkadHnwIH37M7K/7G6mtkQE2V2g4K8rmevngYDw6YTkmlk0PTc9T60A81GYqjfbQTKpnT3PDlNb3yc/Jk4ZdaRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=D1IGK4Dd; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="D1IGK4Dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788771934; bh=Fzi5ANYeX9FFNpk/BMwZy3bmirTTtD4/9jhTXqNFNqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1IGK4DdjPiIcOQhah2F496yr+e6KgZeQER0ZyjN0mJW+c6gxu7OF5tEwTH+BNlw+
	 WeOoJUNfneXs2Izp8tI1oHX5ot4WZKwwIb4tQcfIxge2Rg1TAyj5U4k5uhB+d9M0X3
	 kQws6lUSCCYohvWRnaNsF7oI3jUM2Xd+mJO27NCdz25jNVFnZwmcFIf6EI478Q0c90
	 xRee8vGARZdyi6BTsE1rVqRF9VPmfinNAfVTcQElSi4VAUpKBDrUX2FzeaPKTsBbn3
	 qCTxrojpqjDia6BPB5WohYivBzspYi4UcEm3vlKxN2jGXAVZU27KrYJU6PIFCzRcSn
	 HEW+kdFeiNkiw==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9e7e5e-0472-7f0000032729-7f000001b990-1
	for <multiple-recipients>; Mon, 07 Sep 2026 11:05:34 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  7 Sep 2026 11:05:34 +0200 (CEST)
Date: Mon, 7 Sep 2026 11:05:34 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
Message-ID: <20260907-classy-crafty-clam-a9c0b7@l-nschier-aarch64>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
 <20260831152523.638881-1-manuelebnerli@mailbox.org>
 <20260904-stirring-zircon-frog-ea6949@l-nschier-aarch64>
 <a2066238d2be3cfd36cd6ea3a7bf11206cb0a02a.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2066238d2be3cfd36cd6ea3a7bf11206cb0a02a.camel@mailbox.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788771934-5759895E-5B3E56C7/0/0
X-purgate-type: clean
X-purgate-size: 1088
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: AB326A0161  external: no

On Fri, Sep 04, 2026 at 07:02:52PM +0200, Manuel Ebner wrote:
> On Fri, 2026-09-04 at 18:11 +0200, Nicolas Schier wrote:
> > On Mon, Aug 31, 2026 at 05:25:22PM +0200, Manuel Ebner wrote:
> > > The optional tag isn't obvious nor defined. Therefore replace with column.
> > 
> > Why do you throw away the 'Command to check the version' column?  
> 
> I would do this to get some space for the optional column and have
> the version commands in ./scrips/ver_linux . See below.
> 
> > At 
> > work, we have a script that uses these commands to check the actual 
> > tooling versions.
> 
> Well, I don't want to break that.
> 
> > If there is a reason for change, please document it in the commit 
> > message.
> 
> Will do.

oh, I'm sorry.  I wasn't aware of scripts/ver_linux at all.  A good 
reason for removing the 'Command to check the version' column is the 
redundancy with scripts/ver_linux as having these infos in two places 
will almost always lead to inconsistencies.

Please, break my script and keep on removing the column.

Kind regards,
Nicolas

Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C81A76C7
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164198; cv=none; b=BrqzJEaBYOTcBzgBAjjrIcoPhcHGIx/zihhggK/eAEUYsWBPr5d/m/BN1IeujxWSdbatzHi+IKaxn+7WxzYme91UldxugAqhmr//57mKLdIlAtzrmRWVScD1kb7SoPzX6OTuWrW+IJSlV4r4XUbPuj6sc0fZEgTKQ6jsRbPGK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164198; c=relaxed/simple;
	bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6FWjUYOVKemFYIBUt9fx50+29sj/8KQ2aBQHMa+RAWiuwbHXTZdixhq3be5chgxTpwQbKiZB1TEpo3+hMbpKwlJsRFrigYT4h4TslJ8sHzdfoDTshKzOYDUj36k9cAwjx+Es/QcbisxIuKkCYmoujAgrCzxYkS9TexUzJgUeJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aTD9KwSD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aTD9KwSD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862f32a33eso6445922f8f.3
        for <llvm@lists.linux.dev>; Mon, 06 Jan 2025 03:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736164195; x=1736768995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
        b=aTD9KwSDdbOGNOmnnzuk1RU5/Qs8YV7HnoA+q+dbNnvAlGVT6lasMV7q4W0FMCYk0r
         Z1WCb7JTN3n/NurArV+gBTBEu8N0rt442J1YpTo2s1QlN5fDzvshtLK6rIRwv6qJaRJh
         q67npCt5SEuXNVJBjw0mN9r2u84ltT5GRCIIWfqPpTKvbSD024SWSvMLJC8bBbVrnrGY
         kjzVRQHOB6hqji/Z68h+gXLMh9nBoZ8++Il7XkhIu4ddCzLOlFG7BJ8tpbQi9Lh4EVyp
         B0z5gwBwTPlye1pwbB5rQzEJpULXD3jrJW49//FrcdsQYpUiOCOvRLWVbjGkUqL5NBzH
         zm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164195; x=1736768995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
        b=VebXrM+Iz9UoJcY3VaL4d29NClN6Ukq6THW+fP9tDvIxYMJiXFaO0Ok+oFXSuiSb0B
         F4UgJWAqtYZNOTAG3DuDzUgWuu4ceCMmJzGwucTb7ry9Nr+R6zmbi088qQ70aJblFKe1
         qg0pBty4OLNBBi4Sh7CP1PMkdWwJ81rgfPqFsfbbUq97iSCk8ryqraU0ldx9GPWPYtkQ
         JaJ44JA+2rAbCGIG4JIH/aj9+y2LJj56wCIo+WwPxnzQER6pehgQ6HG/WAqD6idr7n8p
         Ird0dyDzGxEgqxO2yada90zM1sZL8cjIbQEHs/g9CE8oQIsMZOmf7bABpWCSE4pEDJ+H
         LUXg==
X-Forwarded-Encrypted: i=1; AJvYcCWdkIdpelPBrIrBRD+iqxfFK00AF9EW1QnkojPzrfhHLklwId4rTaYrbfkUD6fOS7enY66y@lists.linux.dev
X-Gm-Message-State: AOJu0Yza2EpAPlRep1Q1Xz8QL8gTI7XPNCUj8w9S7BT3AccSRoFKmbh7
	Fr4Z54aBy/YU/tEZuxfCnk2S2NokHr7EZlqJoW89rQesJ2yG+n1/2yrRf3Jh37GFOYtROG3knaK
	Yfp2j86Be3R99XXtDA8rjAnDDoYwpLRaX8Y348k8fmx/IcoKYrWZG
X-Gm-Gg: ASbGncuZJGvs+zsGzXMQGz6qEXBvzLp2smVRiAB4tNqKFqzqzRTcXzGERXJekRVz1l4
	wYNeOYNh16I3e2DzksR3czHkWv2IPZzzojjynZgiP46Gz1flA6ut7zhc679kxfw+HxKZp
X-Google-Smtp-Source: AGHT+IFTVwCtZdYxRH3gg2J8q1c0et3XC3IEuJFb8eqipTN8aLBnWtMWzAE37+Ba+8Z+XBOu21Ozobzo0Pb/UQtiCH4=
X-Received: by 2002:a5d:47cf:0:b0:385:ee59:44eb with SMTP id
 ffacd0b85a97d-38a221fa9ffmr47376443f8f.33.1736164195277; Mon, 06 Jan 2025
 03:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311507.14xdiaIX-lkp@intel.com> <Z3OyANq7fAkCs+Qi@rli9-mobl>
In-Reply-To: <Z3OyANq7fAkCs+Qi@rli9-mobl>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 12:49:43 +0100
Message-ID: <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com>
Subject: Re: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded`
 in crate `$crate::bindings`
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 9:58=E2=80=AFAM Philip Li <philip.li@intel.com> wro=
te:
>
> On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> > Hi Alice,
> >
> > FYI, the error/warning still remains.
>
> Kindly ignore this report, which had already been discussed in [1]
>
> [1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy21BJQ=
GGYdZSZA+KV=3DoP6q9iJg@mail.gmail.com/

Would it be possible to upgrade bindgen used by this robot? Please see:
https://lore.kernel.org/all/CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh9Fyc=
DYGQ@mail.gmail.com/

Alice

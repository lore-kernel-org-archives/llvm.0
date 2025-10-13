Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B02BE7C3
	for <llvm@lists.linux.dev>; Mon, 13 Oct 2025 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760330299; cv=none; b=solXfCrg/B0h+u3YEV9vFDb8xN7cuueQ/BXf9IonDM/oBsbwp3OLhIxTrGiYV/lyiyCEYe0eBuYObLnFJKi115PA7klzYJwQyD0QTOytdRvT/DEwR90hxtuHNRuLWD7gcMG2L7RIQUB5jqFNC47GV35P9WoIGfUG6hKokPogY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760330299; c=relaxed/simple;
	bh=u8oK9s5aByPzbWDSJU0MuNHc93b7ngPnC+4lAT7yplE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbIaS5jBx7K95mLp0yMYz6h35IL8QpWTCesuaG2oL1pW/yeE/nBLZIHbpw1hrRaPnGSaA+dsVDUojMnfbfszStgWYHY9dalW8H62SCe9kVga3KOSEz12hNVzTY9CgXQh+JmXiUzF+0ohvlbsSXQJU3iEAbk8gnXpzaVokJGLf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPivlS4S; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPivlS4S"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2680ee37b21so8303285ad.0
        for <llvm@lists.linux.dev>; Sun, 12 Oct 2025 21:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760330297; x=1760935097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jQ7mGdL6AjL3n52++SuIetPTh8rjsnTvNAsGSM8T6g=;
        b=jPivlS4SyoROJsIdMNxC2p6Zy0F4/FN9vagbkWkzsXc9P97jZYfkV72PR2ATn5ZWE0
         tZpw9uLsSg0YFzXrARLGeTCpo8q751l3VtqU1s/Op/YMF45kty7yVZR5NxI8MvdJ1igc
         ROgx5ofJTEv1KByAoZ7DuBfaMwiCwBCNkOdHVnzRV1ZrkDUvYLjNw0fm47vTx2YncO9L
         ZYOSTUYtCu91KFITRasiQd0EXyg33FSrEYKtPqU3Gj1P8S9f+TvYLiIsKp6XgGIPDtaS
         gah3Cp5qIAvmNU4M8RoiLcnIxVMFTNGXuIFjJhlwPNOUd/3zrV2sSdC7emgIELTZRVkH
         K+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760330297; x=1760935097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jQ7mGdL6AjL3n52++SuIetPTh8rjsnTvNAsGSM8T6g=;
        b=OJ+YUpM1bUu9BlHpmLfjNshKIOwGXwg55m8M+FQFrxLMEtPhMRK1bOCQ/+jbuA9x94
         n8mttfN988154k7A3etnKWLYGdqUtWHshU+p85cT1zj2pXfVAegPuAX09ZZdk5o+trxG
         bQZnQfLl4CxyIJhOh0AZoT1YLjkkad5BUtHcOXaomyHp09QpRZ+9O1U6wryBNo+KxWzt
         19LKOor7QEyfPBtnr3DrDeXmBTOZz3t+D7lGFHXQHcV8aHSeahpd7MLGyn4mYOgDcsZS
         3jHR15wmXXL3/bvT/Qn5KaFtaNkzFnGvJcsuZWOgFnCRsW9+SzEvT06EiSiQ1dnPdTIG
         BxkA==
X-Forwarded-Encrypted: i=1; AJvYcCXGJeifYg8hikNgk6AgFd8nvhBJxNfsLGdUhc0uuqHwAJo8w4q5Zk0SXZDV3EgwtzHUut0H@lists.linux.dev
X-Gm-Message-State: AOJu0YxlkbKybHSM7ckb/Du5kRDVbTdyz+b0FVHV4P8CmWHIpx1bw+EG
	qbivwk6u+9wYAh7ZMQmzuwU9Secvek+KxBOiwBZ8KYd8alT1BEZFXF0s
X-Gm-Gg: ASbGnctufN0WEeM2bxsAoQHghfHwYoopz14PJ+RvpgoczibTq8RdRS6904wSqqDnFZq
	LfUdNtiAMC6FvjRHCzyKGbf+hV3RTglY7TJalKAp9yM53QhL/zwIlIygGZeij8oBTfjAYogvlJX
	4hF57OEXTIfhExZpjhdWxfKlE19fdpIopDukXeSu0FoyzzRt6g25bx/9Z/rJxs6cARfaWmivAEu
	ZCArfCQQ/RWPCQNAQmw3zMB+LU+yasr9vPk50UR8ofSfjbtYix2Ls+3HRRMYER3OtebPjwkxf4v
	9rlivTbz0ev7mi6eZW2a7IMt+gMrst3ii0KVZFJQ7uYA6pmj0LX7FjjZvcMa4G8D3mkpFyb+iJs
	AQLJ6IaIUQ7TTRl0IXZI6Tv8/dtxgP4F8Wnl2MQ==
X-Google-Smtp-Source: AGHT+IECDsp7UtBNbkAMUan55y1XQuX+ULfYaKfSidXHic/wkkfkYOISn2UHW8fXUSR6MSLEloK7xQ==
X-Received: by 2002:a17:903:24f:b0:26b:1871:1f70 with SMTP id d9443c01a7336-2902727f94amr119251795ad.5.1760330297305;
        Sun, 12 Oct 2025 21:38:17 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070basm120833025ad.77.2025.10.12.21.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 21:38:16 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: si.yanteng@linux.dev
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 13 Oct 2025 04:38:10 +0000
Message-ID: <20251013043812.13186-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003074939.465517-1-benx.guo@gmail.com>
References: <20251003074939.465517-1-benx.guo@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yanteng,

I’d like to confirm the expected use of the In-Reply-To header for versioned patches.

In my case:
  [PATCH]    ->  Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
  [PATCH v2] ->  Message-ID: <20251003074939.465517-1-benx.guo@gmail.com>
  [PATCH v2] -> In-Reply-To: <20250929163531.376092-1-benx.guo@gmail.com>

That means the v2 patch points back to the v1 message ID.

Could you please confirm whether I should start a new thread for [PATCH v2], or if there’s something wrong with how I used the In-Reply-To header?  
Thanks for helping clarify this.

Thanks,
Ben Guo

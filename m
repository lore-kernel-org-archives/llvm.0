Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B525275AFF
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881645; cv=none; b=WbcO53jcdj3oSAn5SCv2CIxFIl+yqs2MhZ9r4yhOs9YyCwAMr2U66wnGlaMuab2TCpfwUUZuYg4qMquLJxpjwLk2u7MSZU0RAFPDIvjtZGsRgym/UFAOrwt0xlOuQRXDtwPWpYRAKpnV9G6n9qHg95xxMWGh3k+zEZ11rzsj6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881645; c=relaxed/simple;
	bh=di83QS8+oAT1E+aWv+KEAdublIK6kGyoYIU9ovp0L/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYB5qzfXfiBEZ/F4+BPzCJqld8dQl/OuvXQDJ/DdushF1SfRovYYlqeyyujUMRfZiuYbquNpZlI3bLX8GIPWx7KgZcKEoOIS6b/hAfOQE9/E3AP6svvNBUmMIKvqpbhRhP0Hm9NTkXbfoEVAli2FrdEk9098Qk/IiJsglz7QoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0nnDUPA; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0nnDUPA"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so1262177a34.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 12:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881643; x=1765486443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjxV1GGIN9looIm8lhU6Qg0odw82tyPmLwTXfLVcqr4=;
        b=b0nnDUPAEafZqqJn7ITNZKsmXBFFqrnzfabTVUjDzx3FY8MTOr1wKEbpbidjWoNz0J
         DV0cQ9SLNZUeU4Lye6ENzYXGQnnXoMu6FFfiqApR52bW1PyG7SzVoopx2S1h/LrVEdub
         OFO03C+7bvtleSDsYRDVIcnPeL0dzxoGyFt30osc9qyh4vlmoMB7BT2ZSe5hffVqh8yY
         /PKLTmTIGh4vRQoXmMv9QDYKZkwqUd2H6uodg73FrD6EFBUicEYWm04FdHyUG9d2nnHU
         OOVqpgHRGbqzVOLTaZ+lNPsPlVweT2no5sBfWfq1wJicQMK0ycSD+5P7xHOujavMKo2d
         qNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881643; x=1765486443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjxV1GGIN9looIm8lhU6Qg0odw82tyPmLwTXfLVcqr4=;
        b=SIXx5MyCExgz7RIQNmntzEF2sb3J1EC9NS0ZEkuw9YWlRmeKuvOQNiXcRQGyoUkRA+
         13PmqqVRaLM0tic2Y/0/5kz7R4q0IE/AxMOC1hNccObuvq9Ue5d0qB8HYrsQ5aIZzJtG
         YPfxt9p9uxsvUXDmQ+1GMzjii3zF7cTq81dat15nrI0uuNu2MZcdRytRT52M4FShlf9o
         epOTBRNoxnBRDEND+6WmnJdXArz3DlPaWXBBtX78aAJ06OlvTknzNNoar4McNMiBwFfE
         07YKFgQHYma7mC+T+wQWuyu/9mjv5PhUjGKFePkslEFVg1Pz+o11gEMg1YiQONie+53c
         VWbA==
X-Forwarded-Encrypted: i=1; AJvYcCXi1pYO4g4xno0GtxvaQSjDfixPOLqiDtcRETGXbaA6AH8EvPFXKTVdbFl4/l8PB0V1Hp70@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0rQUOb5OTbgvNabXrUVad0CSmkMcfefSSKUYu5l5JtYi2f4Kc
	31DqFBAmjiiUPnZBY9WI8Ens2/XQqk4uibi7033y+DIrhUug6liKHgiAafjRwOJQrQ==
X-Gm-Gg: ASbGncuoLBHtWR9By5FOmtq9ce2HTmDOxaAbBvm5UKqH/8HYnqOt/ndr9nGsRvEO51v
	6fEM/arjolhSBvRkA7visN1pywjKrJaWginzhUCMdrTPPLDJKQVE4p98grDOO9sHHbD7WmKgkgG
	dk090ZymUXTvJXMRJnr5U34AiAi03AQzI2aggYoZScry5o9Lh4AES8Yn2liaz9FLhkvkWUy61Io
	8oJnoBZ9fw1sJSIR+HQ9BE9URQr+rvLAc3Tx1XHGV4OI53+CmytBHZ7h33jYPl7UoRCsLEElMDW
	OVaXVnrBiCwojN3uvND0LM0jJHlBoe9uKO6pR/02OD0Iq6zk79yHRZQ04VAXHAtkzHr/6xYi4Ck
	lhUJn+Re/7FRO0uPf/Mcvczx5Ne0aCgZnxZ/dItanc9Flo1q0O5rRUn/PsZZXUbG7LGrmYTArue
	nSK/HSxH0CGVjfq9mJyEv8H5C4qUffwuRgG+1B/jcynDnIUkl0iilkV10k
X-Google-Smtp-Source: AGHT+IFc4WbzNmVwBOO7OsptYXIZilhlzYjJdJRMxyn1AGPFNdJAn0xtmay3Ejl641B+vFs75D2TtQ==
X-Received: by 2002:a05:6830:24a:b0:7c9:5810:92db with SMTP id 46e09a7af769-7c958bc42acmr1961422a34.29.1764881643438;
        Thu, 04 Dec 2025 12:54:03 -0800 (PST)
Received: from google.com (122.130.171.34.bc.googleusercontent.com. [34.171.130.122])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acb0565sm2127096a34.24.2025.12.04.12.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:54:03 -0800 (PST)
Date: Thu, 4 Dec 2025 12:53:58 -0800
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y RESEND] KVM: arm64: silence
 -Wuninitialized-const-pointer warning
Message-ID: <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
References: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>

Quick correction:

On Thu, Dec 04, 2025 at 12:50:11PM -0800, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways.
> 
> Silence the warning by initializing the struct.
> 
> This patch won't apply to anything past v6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration"). There is no upstream equivalent so this patch only
> needs to be applied (stable only) to 6.1.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Resending this with Nathan's RB tag, an updated commit log and better
> recipients from checkpatch.pl.

My usage of $ b4 trailers must've not been correct because this 6.1
version didn't pick up Nathan's RB tag. Whoops! Hopefully whoever picks
this up can add that for me :)

<snip>

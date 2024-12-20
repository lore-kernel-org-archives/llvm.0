Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DD1C07D8
	for <llvm@lists.linux.dev>; Fri, 20 Dec 2024 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694220; cv=none; b=DtcXeUVMszRu47wU/O2yaRnpx8FBm2hES+0FFWn2o257KnBv7MoCMrV5ZYN/gugu0KIJkHhOWNH0sz4uz4eadqnhIUY17bqEfDUa5wCfzo3jrQ23XtQWH6Yd+TkKEfzFvvhaWzdZnSXA2N5TwTlhfEN5cF2Dc1I51oUiY7rIi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694220; c=relaxed/simple;
	bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edyk1+pDMnFXZscqclTilQQrTXFfFIyZeDcg0GLnz+F6wrnByyxGLCN170Z64d4/jG5m4CQxp/h70HcLKumh5jV9zcyYDuzB0mhzygheOgO5iTzrh2YlJg9kP9uVCXccNTrn07uwfK9fQGJTnt6UBoRK1gYa91EjAxraGH9ixtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GV1mqoW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GV1mqoW"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so237761cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Dec 2024 03:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734694217; x=1735299017; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
        b=2GV1mqoWInBGdvrT1TRBxSOTUEipM8uK7T6CEc7vceGnAlIQ89WGPSqtmdv+ieRMhk
         MPEGwqDSbYz3LWPARwb2aQxwHk/ztCAvTc1XnCw1dvs/txTNgyyLfOOxWrC4gZBwF4Ed
         /yFMonxPLftMAmbZ/A715odvK0KYne2pUzq4yHJqeeV55RhOq9oA/fbJG/764C4Rlp1D
         MexJxwzpmJmD0eS/pHQ/EQzSun3hskKFHcFVKNboli3pbEZA7qd7Ne5KZXoEeZDst8cE
         RYjAH+9TxqsN/CPyOK+PA8x31DtX9/ACiL9nOg3SOqnFcqnVd5FVgKkvv72vZyyG5AW3
         Wa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694217; x=1735299017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
        b=E1N1fW9HR+2o2yXuaB3IMtG8n1ZE1hxmVzOTzlECCew5aEKOHCml2unMQwHleWINrN
         SQz6h1h73kN4+dKxwB/r3xRJ95yBAB8sqbVXY2vA91mOwla/EaEsJ3lZPgyswGfwBTeV
         gIgqk2aohpgBRxMQI8cdAoMn26CIfsNHh3IW0fnf24xeeiSJQ67ImDZCUSsR1wpUprVU
         //ISpPgwQuRJ0dRzBniqwbxVWTWJR4ys2nMHO5Eb/JIF4cQzZgFWTE0NUbJ46ijbUm5R
         5VCyzMJ6l6Bscn4FQQqBTbsdQL2Y3x38e5XcVPH+3+1y6+F8CH2KofmM7ArKbHw1kpN3
         HTeg==
X-Forwarded-Encrypted: i=1; AJvYcCX7agFo3IcduiIIcEtJhY3rfow32H0ncA5BdZYYc56gfzx298L8iEU9WJlDvDRtyDF3sYF4@lists.linux.dev
X-Gm-Message-State: AOJu0YzMzDn4aglwnepdeZcC5inK/KJBYXmfc+LkSBBPKEyCZ/s/HlXh
	pb+NmphH9JfJvjLQc6YrpePBjcQE0nhlkJBB1E6UXfYQDFt0WU3lbRjLNy5OPKsUjFTraIZMizv
	qvjr6BJwQmbkbMkOjNf+1DPBufwPwmEvNcOHm
X-Gm-Gg: ASbGnctdgTfrvbvXeFAf6gPhEsRgLNI6v+zHVHCAF0p55diRzR1JBca1VCPq3FhNgMP
	tpDZ/l1TlrYnqcWlPiLzfwNq1Zw1qhz/cnDE=
X-Google-Smtp-Source: AGHT+IFx9U+xLB1Iah17RXYjv+Bd0r4PaIuSx7zrULAun4a/KOx5DZxVVzs+0l2hp0P/oyd9OsFZ7rNfwJqoNO4NIfQ=
X-Received: by 2002:ac8:7d41:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46a4c00c9f0mr2251231cf.9.1734694217319; Fri, 20 Dec 2024
 03:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe> <20241219221913.GA1259354@ax162> <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
In-Reply-To: <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 20 Dec 2024 11:30:06 +0000
X-Gm-Features: AbW1kvbUvGbS6rxlevM6v1XxoNqCZYBvRvbI0iHI4omXl8vm1sC6CfihXAB2Cu8
Message-ID: <CA+i-1C3ry8eeJ3ZgEUw+7=RteVvq61xcphg8KaYf2GBRr1mEnQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 22:56, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> One thing that can help is to "export OBJTOOL_VERBOSE=1", which will
> tell objtool to disassemble any affected functions and show a backtrace
> with all the taken branches leading up to the warning (if applicable).
> Maybe that should be the default for --Werror.

This sounds very useful, I will do this for v3 unless anyone objects.
If we're failing the build the risk of a mega-verbose splat seems like
a good tradeoff vs the risk of the user having to go and read the
objtool code.

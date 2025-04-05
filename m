Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63347E110
	for <llvm@lists.linux.dev>; Sat,  5 Apr 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844291; cv=none; b=t0jMVKtRr+eMYgmPsv9GILmkQGt/BP/9b2zF+zYneN+omYunW44XrURxKGJqkl4WhsQKwqK83BHS6D1gUdff6XboSdLWJTxswejVGaUmnjpxqlJMxdI1b2T7WLKNUzI9YE1laXrq68ZMel3YKkRmEUmRUQvuTF3uifpoIW67SPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844291; c=relaxed/simple;
	bh=SLwH0eFw3b9k9qJaHyDs8HghjeBOT4plEWyldDnfHAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQEMLd+lEEqb1TwLGa9lFGlKsb9umKcZrJYrGTylFe52sWUxXA7/0oZcdjR7TqT3w5wGctmDnIqonL4UPTH48NqmVSuP2/kem21/nZDRVW5sLyouEO1qd+Hl13urMUmov33WcM4wnwvHupyENpcZQvuAE4EsI0cHekXjLWNy3GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwPghL3S; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwPghL3S"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so17937315e9.1
        for <llvm@lists.linux.dev>; Sat, 05 Apr 2025 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844288; x=1744449088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jppA3+zjUadzb/dB3vJ3OKtgaoopfwZTi9MWUSVD6mw=;
        b=DwPghL3SjQIkKpa9iDPiMw98Xxas6FcxniXfbhFaxBP+4RO36wMBfnwygkgOdir4e0
         N1dJ2CF9amBc4ZUrCE6RUu26rT7tl+hXr+PVAoY4tSIaEZMFgX/slb4mXYpIiX9RP/NC
         XFDW5Ig2q4rI9VrIo1lywotSqK9D7N6g++ENB5ABFLIOCyceGxeyJz8W43gnxz+U9N0q
         z66zZEg5Uh3IIbZ5KjIUNPsQXcJjLNJWGRnLtWj+Xne/oZzEOm8GeZDxunolA4S9ure4
         XR6sDDiJeYtMPRZvZrdYX7Lkyeo4wmLADbJIsrL5bZ3rLYsLHEiwqn+G4/LyQmtIoUHP
         Npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844288; x=1744449088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jppA3+zjUadzb/dB3vJ3OKtgaoopfwZTi9MWUSVD6mw=;
        b=Amai+n2OjY/g+qw89VHdmC1IOp3jZxWEuajxWveBv3EXUTN+GUzAkKyoPdWbfHXglZ
         oMWb+ueh6rO05AY88ZllON2zZxrQhEY9MHzUMYNaCOoMEuUB9fbRgsQBxKXgCBhbrGOa
         d1PboAxbQIRqxmrqv1liNKZjNipKHczPfun596/anx3n+TIA6gALmI4wP6OK/CdJ0Wwk
         VGR1xhaHC5vt6zkQ1z4KxTj9AV8SlOjLKkt76xqe5tlILcpb4NFjShyPkQLhAJh7fm/l
         hcW1NDe+8wfWqK0jdWJDplu4wJYcB2S7iyRAfH4l4frMF859nGcXYiMBKn/gMKBJvdTi
         dGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosqN43X4HjqDxKbOvnmZ/JcD3wH6kZx2CxFj2YjTDh/NmN7tQP0B8D46J5FrDz1o7sQY1@lists.linux.dev
X-Gm-Message-State: AOJu0YzkmiAvk1d9fG2Aq/kznDpGk9UrooQsumxTeEwyeBo0++tGV71d
	y8XoPOQQBlWYoD/VldfvN87J8S7Mzv/jBvZmu17l5VXLVqeT+/0n
X-Gm-Gg: ASbGncu9Rz4Gl3lzVXxCsjRmc2/258+2auZLlx70qIBvI+KkYAhCqCFvWoQcqznt8qq
	3RRh8iwr1yoVpUVRnCRpfiD/jqbBrGDQS0KLOjPI/lyfG/hxsvFmrydOrgI/YD39jXfAhqAIopK
	WHMBwW+UJLmAdw75vNSc2HXwGxWEziKKJqyZWBhdYWEcUQqAW2/MUtPzq9gfv/zOhw1Mh1all42
	rGnqgWDLAO3P5ZuF03uW8zkiQOaEubeZEElkW8ZT9QyTxC/EuTO1uk+blRsJ4k7/oWo+4L7Nb3V
	c5AjVjSobM0Q5kqPxiRYC3+btnap1fRgmFVDLEVTeVi0FBlcumCc5NPvXpShZPf513W5AlBQM5T
	Znd/zQ1V4AAKaONGeiA==
X-Google-Smtp-Source: AGHT+IHU9XxLHRCNlj4Zxv1RQb+K7/LfcwCdYPa0pjMEmX2mnC17XmsfYcuLgQgqGwTFioGIQTPllA==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr60136395e9.31.1743844287884;
        Sat, 05 Apr 2025 02:11:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69a8sm6316776f8f.49.2025.04.05.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:11:27 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:11:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Message-ID: <20250405101126.7a2627a6@pumpkin>
In-Reply-To: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 04 Apr 2025 15:10:01 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi all,
> 
> This is a follow up to the complaint that Linus made at [1] about how
> the #pragma and #ifdef to disable -Wsuggest-attribute=format is
> currently ugly. Convert the #pragma and #ifdef to the existing __diag()
> infrastructure in the kernel to hide some of the ugliness.

It's still horribly ugly.

Perhaps the compilers ought to support __attribute__((format(none)))
to disable the warning.
And then disable it for older compilers.

	David

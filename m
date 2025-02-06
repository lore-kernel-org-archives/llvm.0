Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE71AAA32
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871822; cv=none; b=lqLUwsZ8n9DnSbw8qD2Klw7p4JIQeAF/jFBLu5fh+Qj8FKKN8IPkx3JQVmLh+zhU/Ux3eGoQXK0dhOSqQAiWV36HCrT2nTNd/hJf4CvEfAfE0yI/kyThbm2tMUr3DUJBMigPQYHqcCDdLYMwVJUtsj86VhVe+DJMfaXjoEmJYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871822; c=relaxed/simple;
	bh=m29euKP0tRbm1pfzPENkzHxEPSHo+gfSNXCTL4qfmug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=raoKFYInlZ4sIjf9hATrPxQnBUSiS0hD4RZTamHdyEG6lBVMbIl7y4r1pJevZ+H2KczFGbns+RwkylgkeMPh0Hds6GtdZBNJNz3zDFzgSaaoPMyfVWDClAj4++rCwOFK7SYyS37vr8Mlzywk++gKIAF51rami2BOPtIq+S1O20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJhCl9zI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJhCl9zI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436a39e4891so9241375e9.1
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 11:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738871819; x=1739476619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BcIyHBsPlzNpYJRzgarV1TA18Vy0KuhGFQwaCUNHPs=;
        b=FJhCl9zIcTRAWPpC7xh6M0TGaAL/lccI1hK+kjydRMFl4bDScs8sZeUEzKIoKeBm7X
         IXYoNNL9OvXAid5/bL1DUq7RsqaV8mLLl7FDyTmE3tAlhyR9Z5YSahPz8nMsEymEwfVK
         26R8WELnKAmdE19blk91ArwYiP57PjRwXYKiSdoOHabl5VsE8K4udi2GJ3QOlqijQdVW
         Xp6bjmokz9OWOvnm5gWICEYpUb2XBn/bJILvb9bPlrEN6eLg+36sYhjqPfjUGL1LFwLJ
         ZLWlet9u24J3L8Mq7r5ebVBJBN/Ln4+eRb5SbNAUNxOMDnGJe0KOPBVY8r5oWg/bLWb6
         Cviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871819; x=1739476619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BcIyHBsPlzNpYJRzgarV1TA18Vy0KuhGFQwaCUNHPs=;
        b=xEXAiLwU8FbpJrMjRd0/xGyAp54OJzlIGRiBs92s3cPGQC0S2OP45sidGVX1o17bJz
         TPKbknhd19c4BO0YOxJq/cBZBBAkOWEiYc1co7OfZVJ37zk8DK+Abt+vOGUve73gOrrL
         ma3EMGlkJvoKXR+zMnxI0m6H5Fknz0rLqcGtxxcPDvBVIXvuf2LG2GCrpifXran/NXXA
         C+mEsW5mS+b+zpZ//zexWuv41TqZfDv52Iep1Kb/VaNqZA6A8doVZltYoTb/3B/NAFDd
         1P9vVOUeAMX7EMnGEpYxHoAkuy46TlaVe3VFLNpNPvZ9jU0A+/fXhFOEPh/MWdLGRyNy
         QpZw==
X-Forwarded-Encrypted: i=1; AJvYcCWeDbxYc5Yq+9EC6WAkOUQ8ytwRXWxngJiTzTA3Lq26SxgxL46fDmsL6kMXil+KC8Tv26gN@lists.linux.dev
X-Gm-Message-State: AOJu0YwjM8vNWnZNGXF1EDNZJEMB7lL+HN6W0M//gJBX8eMhRhlECkQv
	ynDGkavjseyMEBDgmfjJIL+f+hqA9wpibCDx+c5hyYE0BV3QwNLi
X-Gm-Gg: ASbGncsUY8RhyYxI1sk4+aFpEVdrotlFmd9n2MVzq9U65c1JSHbjG0jP8A3jCOBCeNz
	jn8X2nWw1om8haII81aZStYIVVPecQcpL2Pe7DZZr02Y8yvzyr44cKV+JfCrcs10CgNvsFJC/r0
	wz1Oo/fD1l/PmDXARklqxhNVs7pHSbQoNnZnC/0CZffqNWS3OIW3wlfnHK8e5JoPGRCMyPY+52J
	0/OG6oJ1DrLeXYsEAtJ2s2h78Oi9cOkM8nRK3nvBaHK8ijTWlfLfVfNie8JLaIin6FDjhKdZ7/L
	7Y//vmfdUSLu2hoPMD26a7KSQE/8UCfHfXf1u5kmp5vv8ajR7zNC0g==
X-Google-Smtp-Source: AGHT+IH+OL30IFfRMNsPtlHNYkTxJSj4lsGxvGMTQ+15ZtUvzy7gINcPStM0hCceknYWifHXCEqJGw==
X-Received: by 2002:a05:6000:4009:b0:385:fb2c:6021 with SMTP id ffacd0b85a97d-38dc933393amr186251f8f.39.1738871819474;
        Thu, 06 Feb 2025 11:56:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fe37sm2561146f8f.69.2025.02.06.11.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:56:59 -0800 (PST)
Date: Thu, 6 Feb 2025 19:56:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Andy Shevchenko <andy@kernel.org>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Philipp
 Reisner <philipp.reisner@linbit.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] compiler.h: Introduce __must_be_char_array()
Message-ID: <20250206195658.79231973@pumpkin>
In-Reply-To: <20250206181133.3450635-2-kees@kernel.org>
References: <20250206175216.work.225-kees@kernel.org>
	<20250206181133.3450635-2-kees@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Feb 2025 10:11:29 -0800
Kees Cook <kees@kernel.org> wrote:

> In preparation for adding stricter type checking to the str/mem*()
> helpers, provide a way to check that a variable is a character array
> via __must_be_char_array().
> 
...
> +#define __is_char_array(a)	(__is_array(a) && sizeof((a)[0]) == 1)
> +#define __must_be_char_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_char_array(a), \
> +							"must be byte array")

If you are only checking the size, perhaps __is_byte_array() would
be a better name.
(You've even used 'byte' in the error message.)

	David

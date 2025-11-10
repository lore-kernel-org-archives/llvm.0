Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F382FE07F
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785618; cv=none; b=AeSr/NYo4rmr9pM47YpyBgkraKK5rrOaMTblRS/DcsYQYv9YFnzmc3qCPC/crF+Xm16O4FMhC2/zcXzjXB6K4PQlHp7Ve3jXmtTeLMhl0hohJ3yuDh73lPeD6q64z6ADkxpDHVZ9yV5eMRRzNNKmZ/JM8uhvQk6OFdHZQzVv1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785618; c=relaxed/simple;
	bh=N7+b0a5/X1E9lNvZ+Urqf0BEC1dp6Bsa7Gn5/uzSjgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNivdzbOvBVSrvK8vmHwdpYRv9TmXolS/5geyGr246o1+8iWjN9W/g5HbbuqnQY6jJ88aX01NcJXr9Gt+xKAZwXVbG+vr8xeYgZvNuFAvazu/nwbrkoj8EOVbHh7F4cGIYsiisYZQekc4K7y2OYPfSprobcw5m1CRwoybMTisJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQcvxNjP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQcvxNjP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2956d816c10so33284075ad.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 06:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762785616; x=1763390416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XefgILuYx6ntZN/z3JsLYMzO3kPPenvRodx9fKY3emM=;
        b=dQcvxNjP8twaOTZDdby4Rps2JqFFQBxsSKvSTVh3vkRDJqv407LvMvehl0lEQdTplC
         phhkCJy2nzfr5s3udm+rqoYnrFvHPfEw7wwYstpeKqoFyWFBm1ThFNnfv5gvokXzSr3r
         uFTqqiOfWyjlbq6zZgI+XajQCj7wXVkjIXgR7s6m0hLnO85JbH1bgp4DkJ7YsThSqn3t
         HITARo+dsr/8BAi8cdQZ6w5w8za7I2Ug9vP33KU8qSi7BLXqYKZwHM5EZ+pezYVyU/y8
         Fiw1WsSW08wpYMZg5xMpIXYmfenIceMdMDYVKPjcpQsBJUMOAH37MKjuOuslYGwYe/Cq
         lzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762785616; x=1763390416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XefgILuYx6ntZN/z3JsLYMzO3kPPenvRodx9fKY3emM=;
        b=ndhsSOfIduMWKkZO9XsIkt1TUbiRbu7187BghWsc61vQhNie8FWwcilFHevs2fH9Wi
         eqYKA8CTuOTRV7Ri0BR3pzSMrO3LRtbViwXyLssI7R1Hix9ewL5wNxJhWdQHsvhD8twB
         39oh9eXdVgUQ1TFrrB9klUHKIq7xC8b21XfxeVEFFImRuzZMhA6n+fNU2zH2cAKu1IYJ
         PIoKEp0gEt8nyaYjmvq9tUFkKDdkt0Z5UbSEsourEYQbwi09B/etE6NMIgAJllESLXHm
         n1Irm5q4ldeDtNxRpx+oyMU4Z7la08U6mL1vEUOZLFeAN+Ka2VPqhUPaTanw/qrlcTNh
         p4sw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0nOMkplNtmdhtO6N2KkChcwxtwryBrHuTprkvcnfxDvaoHj/5bPXW+x4bVdYMXQvJpcH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8wKPYVetyXXSTpoD454PZFfW8YNu/IgbvOpA+4I82HqAOyWXW
	IMwCzTB89qjJaHUpSLKuzo6rPMxTvXUyfeF3/VW2f7Pba+kV8UArM1NO
X-Gm-Gg: ASbGncvq93/EeChD8iDALK60T03Zx1RhvCae2DvC5nvWuxqrBY0GCJZJA75JgVUoDGk
	i+O2FsY18Ouppq/jRfZ+aV3SPFK1O/ODfBOYQzvc4XQkUYN44dqpskqTXGHH4oUWPQkDD0orrXq
	QxubcFD2kOOUqVEBPz6VXCdoliNF0vcn0/+XQPXLrrnH4/IlQqRjPDtbk2P5FdV2qG0Cg9HsNoX
	xOpC8GohKuov2xWhC78bYVG5Sact99YgkgF50RFJmITzA3lvMwTk5T1ISXgjBp/bWLT961eNoZU
	XP35LLmRl2JesA80Yq/4G5po4UwyUWGsl6s4MbGFq8/fNhJYdIIJq1rlz1Xk+1a3ZnAf0pBx7wh
	8D+JQ63uZKpKU/TyKAsDx1TgiSKoqTMf8Spo+r+Kar+P4+y/duBIZ9QPI5UYgyw0hzpQHz4xZ33
	IKRKXkfDaRFtGU1pPR+mOOONJX
X-Google-Smtp-Source: AGHT+IEuFgYeAoKVwFkEPaKeztVQ/uT+Ye2WDAIhodBNVFVuJ6jHc7hLNsDatLVqZvHFI/ZRCvYRMg==
X-Received: by 2002:a17:902:da4b:b0:290:9332:eebd with SMTP id d9443c01a7336-297e53e7d29mr104763085ad.10.1762785615842;
        Mon, 10 Nov 2025 06:40:15 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c9c2a2sm148276165ad.93.2025.11.10.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:40:15 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: akpm@linux-foundation.org
Cc: jack@suse.cz,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	maninder1.s@samsung.com,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	qq570070308@gmail.com,
	will@kernel.org
Subject: Re: [PATCH] Fix redundant judgment in WARN_ONCE with clang
Date: Mon, 10 Nov 2025 22:40:04 +0800
Message-ID: <20251110144004.347-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251109090317.4261cff25a497bcc8a358a7d@linux-foundation.org>
References: <20251109090317.4261cff25a497bcc8a358a7d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 9 Nov 2025 09:03:17 -0800, Andrew Morton wrote:
> It's a shame you messed with the whitespace.  And I don't think it was
> necessary anyway.  Here's what it would have looked like:
>
> --- a/include/linux/once_lite.h~fix-redundant-judgment-in-warn_once-with-clang
> +++ a/include/linux/once_lite.h
> @@ -16,7 +16,7 @@
> 		bool __ret_cond = !!(condition);			\
> 		bool __ret_once = false;				\
> 									\
> -		if (unlikely(__ret_cond && !__already_done)) {		\
> +		if (unlikely(__ret_cond) && unlikely(!__already_done)) {\
> 			__already_done = true;				\
> 			__ret_once = true;				\
> 		}							\

Okay, thanks, I will send the v2 patch.

Xie Yuanbin

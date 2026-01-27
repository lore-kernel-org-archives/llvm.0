Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7D3587DA
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522366; cv=none; b=HHBfGFfC0o72/1LN7kv176mSSfuKYSMzbHGFYlaidwhCivMjJ8/imIQ0pIOHTR7fCHOEEhTasHGdugIVHco8VlTxrX4bA9XYad8qJKwHSN+QWjx2unOZwA7aWiRN2kEJOC+M56wzml5cq1+GKgIE/vAtfflOSTd3gyFUv2ydjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522366; c=relaxed/simple;
	bh=O1LOvbIWe6XftbcstULNkzFohU4YkiqNllkpI91xcAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkA87QS6QwdrsJ3wqo/OKkPp3PZOe4bOz6pNu21IoN3Usi5PlArXYICAn/E3/hUY5LCte3OQ2aF0JMHQ+5a+mOMBgB0USuunsrpqwIkzDiv9ywWsPvyUTS9VNxCLLAeHdSzayxxYXc5LsHS0q5X9TjGMaIrAyQdNwxpRJHSuDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=Si/9/8Vr; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="Si/9/8Vr"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d1890f7ee4so154284a34.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769522364; x=1770127164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgaSJG2JDBJWo7rSVGWXUpnG8BKa/5wc97GnXzAZusQ=;
        b=Si/9/8VrXhD4xvmdEKrkumhiuMHyrS+M5myX7ymkmiWnMGT3WU+/uo9USJ9RSMOVkL
         q8jeMxbp8vr2swRA3iQnY1o0efVf8PYkBMpOhesHK5D0GRhfWsvX+SbmJifGxHhdQVvd
         6Pu5ZJ7ATDbjJgT2nnR+Iqtk1rFWktys9G8GfjSrG0sKQQkSHKCiajTvel+r32Div4cz
         +FW0r8ffYLVfDG7/5zLKBTwjNQ8H5xR6x+LNLDPlGjwnukTqX4MZXzjRVgOPvtaRFMR9
         v0mkDWJe9qljwh7re4gsNBFrANCf71/jQJrp57mhv2JK5Q9x9qY6nXZFQHD+aplyg5mE
         YSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522364; x=1770127164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SgaSJG2JDBJWo7rSVGWXUpnG8BKa/5wc97GnXzAZusQ=;
        b=ZaaUOLnMFN9mc2RuURqjAT0yWOYp4uawwJGi9oYg/w+9d/oz/nNOVmS06+Y3Hty4dJ
         BIm8POQwHluh6BRAcIXmRpG81GxmU6b9XEi4DFouPznscMwfCjmZUDa32Jfv2ZKRApFw
         Gk4uZxwgFuG2ta/2kIEOVea0Ribp3NdwdguB9ryxFKeYritp41+6ZQCKGDc9OdBirQzY
         KnHBGIiW/bcgZGrPae7mZfhUhNPMn7fxbB0KX5zCiNJRsAi1ouIG9dr1Lz/+cSxssg/v
         IfESdgPBHJjODbC0CT8na50BzjFkDUQQB+KfkKIWJn4OcGg3mAh8KU7W0bvWKb2u/eLg
         TO+w==
X-Forwarded-Encrypted: i=1; AJvYcCVntKBJr8OXUuGosFsX8a9SzHk5vt8N41IIGcU6RJL5K1I6/eC75+ecXpcM8YCi3CuEKrQo@lists.linux.dev
X-Gm-Message-State: AOJu0Yye9LbKahjlUnKo4fut8Q9+BPp4qBfE8kgNxiYH7OxRBwp6K8yz
	wlfbnraEaUiGdDjrcwtin6SzpmDLBwPvP1HVkEBW8KcJGWnFA0TvlQLwHOsSGwf5t38=
X-Gm-Gg: AZuq6aLzZWX7cpzgJTfKlU8mwXlIJbCH3X/1Oaub1kmxlUJGB/gYRD4LlPhpL6NsWuU
	qyaoxCfqTz7yaFHSGdq08aQmAHF39p4LCheOaslxh2E3roLeTDnR36vo31fDr8wWR0qTYGj+2VO
	BMiFjPXkV5N23SON5xTOMDXebRRfATEEjJbWlNRgdiHgQ0q79dj16In02FG47TfNXP1fEzpHzVE
	Y+NUzpEgkxNFLiVhddWzyflERhOF652AO4O+iHGA5s7zMrSy8rM9NqGVPGaAENelLccL2kOW00R
	5M7XrCDWlMnIQ6HsWFwImbiQhspY6RQVBfcV/WfdZMbBgVbvi+NQWTROeYkXzaj1zGt8i3f0Gak
	+m9hR49XC8NdRbEzFJO7CjTP/C7Puxd+jzNZC/s2c98pyGG2JFvdAvwfuYzaPlYgtmrRKQd2ONr
	snJz7xYU8LkVQBtqIpQZpO9e7zQnLAIU0Ff1aEzOSJ9wx+hc/klAdtFGUR8RYEyRWgMw==
X-Received: by 2002:a05:6830:81eb:b0:7cf:d187:f278 with SMTP id 46e09a7af769-7d1850ca2dcmr1247675a34.17.1769522364059;
        Tue, 27 Jan 2026 05:59:24 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7d15b3d3340sm10034350a34.23.2026.01.27.05.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:59:23 -0800 (PST)
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-team@meta.com
Subject: 
Date: Tue, 27 Jan 2026 07:54:38 -0600
Message-ID: <20260127135917.1597762-1-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a bug in error handling in the IPMI driver, reported by Breno
Leitao.

Also move the xmit_msgs_lock lock to a function and move the run to
completion check there so the if check isn't on every one, making
things hard to read.

Passes the IPMI test suite.  Adding a test for this would be very
difficult, unfortunately.

Thanks Breno and others who obviously worked on this.

-corey


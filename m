Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1B198E6F
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305201; cv=none; b=Kly3d+SS5d0DRLQKZZTH/k+py9xq0rS3kQdZ5AtfV5hj4n1d2myr6IYJ28hceIRtE9CB8e6EdCebVtt/KXPjKf8z0tqm/U6SMLqcMaL0tBmMGxxhT5Rol6WOTJ7d/cDMTz3MdOszJhFgXypXtgXbmZHvW4UbTGgf91JpxyUwHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305201; c=relaxed/simple;
	bh=mCGrJ9w5jYhzkvrMtMVnrjGpgTQEY9PcNzgxPvwS5so=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=HxWpP9utByItJl+Nl3rWXe4GbgiFEH1srzk7WzVIVuJF+xNpAH00gZyYp6HSlAUxJssNFqMffedWH1IuKCu9ViI+G3k9DgiIitEbvHc187ha1Tpjn8n52QZTSpXolbRDlgI92oing6yIJuWrZJbI4XJHU8ReWdmoywvasEWZkxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZlHq6Rvq; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZlHq6Rvq"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6df83fd01cbso14114156d6.2
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 18:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305198; x=1736909998; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIXJVCIS8DfcCstGykVKJfPorx6LhUEdkQ8NsNCAgOk=;
        b=ZlHq6Rvq9PzZ7lb18SYTpIcgqqKiTLTlUHVopWG/7lbnFB4XapdM8GG890PUr4SBY4
         DIdZcdNOe7uhWrZ6f6WEmUIXhXOz2WasN5Cm+xw0UNJo/u0HRXYvHv5nM0O+oisRv3u3
         PjIldQVugiysMTubWL6VV2ZD0OzebSF/ckXL1tvVBvSGFrWvyLRodzwO85hFBYXL9p+U
         LYBY9fQwcNaBgVLGtowCeclkghcj7LBuo2ojy55J8a28LCbDgLAXE+nJYhIVViI3BeI2
         ex8OUO2wj63RrAn3/g+F+JDUZEtGQf6s2FShX+VE2+9PYEojq6HROWJSnycEt04IJtR8
         80zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305198; x=1736909998;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QIXJVCIS8DfcCstGykVKJfPorx6LhUEdkQ8NsNCAgOk=;
        b=QXmyDPtGSzMM0L+WWDwAYqOZHkmzPqRJPUW1qDQ9TJHQDFraw+mC2CdX3uMY156kko
         TmHtfj/wK9dPl8eO4RvNbN9vOnHbqGbloxyO4SRwmtH5Q1ny+7ICZYIocRKp0VsR599G
         mk3xh1XEBqLXhDAVcWHuLKSLSTIKjGcGTTwSsXMPeJr3dkhuCkEbB2VYqa+q/xepwtqb
         yb4UYi+gGenosHVFn6DtjXH8CGNNl8mlkXa9R1jYmwMfvFm3PCdLxARlxGiM+8VxpFTr
         EmZRPNCwJb8j6C7MD9ADFjjmxlbi98yw4oAJqJJkZEgy0U2VJzMMA25ci5zIimMrBPq0
         kuBA==
X-Forwarded-Encrypted: i=1; AJvYcCX9dMstCsrUpBf73Ry+/Ne1rRZMNGoLJcifiYYtYFh+UucdqXgk7i3WEBh5twcpqo2FcKjq@lists.linux.dev
X-Gm-Message-State: AOJu0YwxiTUFtNNiCblnTREGa7qGbBSylgPBR+zP/HXm6t/79GIlArAu
	691GU6rSlRms6KMYdgJjz5IzWc2PIrW3m/OmEO3UhELpMNOINMsH/3JKT2L9yA==
X-Gm-Gg: ASbGncsaoM8aP+aVSgcMx1M88bE7s1jUKSSPx5Qr0wN9vQxVqlO/tyrRFZF4FWkLRgX
	Pk32EaBvXkVFXVAMGbzJsdyxpOzOO9LH6lMomXXf0YKplVJ2obAgtEP0MfvABM+Ib3KTM/raOZK
	Zi727ZIHcsu75jPNKExizFCk3wU7sCRMZWM1TUFChZpRhv2F/dYOMxqz0UKCoCn7Hwo4pDBgtfq
	KDMWvUzJTzNKv3nUTagriI9oWAjrMMVvvsKc6hshkV1RnZpU7s=
X-Google-Smtp-Source: AGHT+IFpYCc0tjOwUQ5yZY3mSaoFRtDcQMBYeoAYHiU4H5ZdQilgu/HQagMJIkV1QvqZLDg3EzGOOw==
X-Received: by 2002:a05:6214:21e1:b0:6d8:8a60:ef2c with SMTP id 6a1803df08f44-6df9b1d2299mr26806426d6.2.1736305197802;
        Tue, 07 Jan 2025 18:59:57 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181373f6sm186933336d6.62.2025.01.07.18.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:59:57 -0800 (PST)
Date: Tue, 07 Jan 2025 21:59:56 -0500
Message-ID: <b63ec305ef9e7e3eb4baa298ce60e1ec@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, Mimi Zohar <zohar@linux.ibm.com>, Canfeng Guo <guocanfeng@uniontech.com>, GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH RFC v2 3/22] selinux: align and constify functions
References: <20241216164055.96267-3-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-3-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Align the parameter names between declarations and definitions, and
> constify read-only parameters.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/include/conditional.h | 2 +-
>  security/selinux/include/security.h    | 4 ++--
>  security/selinux/ss/avtab.h            | 2 +-
>  security/selinux/ss/services.c         | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com

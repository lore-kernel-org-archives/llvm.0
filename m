Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0015A4
	for <llvm@lists.linux.dev>; Wed, 26 Jul 2023 04:58:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3110ab7110aso5843527f8f.3
        for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690347527; x=1690952327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
        b=KAne/S+rw2HDnpOYoq0XxAAGGDmFqVEL+4b4QaJcz22Motczt/sEQi9P3+LqtencG5
         gffk18N2un8Un3gVDBbLDRJCSvj/U8kQRXbeQ3sQi+huU3lOUDhkEacR32UfE0BX4PXh
         R5/AZ6BiObX/u6qK7p5VAxfARPx+dYhRpdGh8YMNmi7dfD3cWvKAT9kHjYSnEJ5f8VY9
         O4DK8ND7BY98sdM+l45wVaQtDojEafUaGFQgGsLdy7qT7doz5fcB77x8RhaQWCvIVbYf
         16flgyVtRYvWqtls+t8zRp/16OIRitE9lb7iBK7d3/SPlHxDXZmPwzdX6fReubLyHpoC
         4YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690347527; x=1690952327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
        b=DTYxJErDZeD/YEvKYujojx9u33oIMHxaWfloIfXvm/SxPS7DvYYl6fluQ9SJCEprdo
         ZZBG8V/+BZ9FQ43irIfANGzyh3aMAcR6b8AfISzkQBw0+ULsGp78Vi9PRK/MwH5CsaYa
         7ZQzv6GmoSa6ng/mZS5unKPw3krPOAPSmrAw+saXWZkqvkCxeVFmixW+34T8MTeiDsCC
         DV9jBV21Jw1rSaxcMDBGf1A6ykYaI4YGOcLedDkJeTl8oKmYeeHPQ2n5ysf1qFh8Q2pL
         xXQO4PbZrmC4bLhf91OIRzM2P2E9374pRzf2+77CmCXm69Jc+AvACGUtA1ShFBm0U6EE
         f30Q==
X-Gm-Message-State: ABy/qLZUU6UkzMVRAICrIXCqYnqxZNCTOl1dXH5375Li4CoA3ljv4Lr3
	jK2gf/hkvZWJIzkgxgT8RAJGbA==
X-Google-Smtp-Source: APBJJlGmyTCKXK1KhdP6dWBqtNLQ81LaRl/lodbuRe1N53MLle/JLuh+e2iJ/WFJxYTYet9lHw3Lew==
X-Received: by 2002:adf:e3c5:0:b0:317:5d1c:9719 with SMTP id k5-20020adfe3c5000000b003175d1c9719mr515001wrm.9.1690347527148;
        Tue, 25 Jul 2023 21:58:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d6e0a000000b003141e9e2f81sm18453128wrz.4.2023.07.25.21.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 21:58:46 -0700 (PDT)
Date: Wed, 26 Jul 2023 07:58:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	andrzej.hajda@intel.com, intel-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mripard@kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <a4350cec-4ed6-40bc-b68b-3a3a89aa08ac@kadam.mountain>
References: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
 <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>

On Wed, Jul 26, 2023 at 09:21:50AM +0800, Su Hui wrote:
> On 2023/7/25 13:51, Dan Carpenter wrote:
> > The reason why the first five attempts had bugs is because we are
> > trying to write it in the most complicated way possible, shifting by
> > logical not what?
> Wonderful! Should I add your name as signed-of-by?

Sure.  Or you can put it as a Suggested-by.

regards,
dan carpenter


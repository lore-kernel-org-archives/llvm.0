Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E238BB3
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GAP5y/7z"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c63117a659so2656653a34.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696868336; x=1697473136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0reFAzRvsauKybkytWT5W1CKofJm2eID7oqapjKx08=;
        b=GAP5y/7ztWbNRwLdqg9cHyYsExQTujyp2GcNl/FTAz6BbVKSc5VfuskjujWz8GoxWb
         BdCZlWPUT5YOECvhumti1XF2YEiH5J/Lel5JJ1cEFkfx0wEVvn8dC0SvHmatsvA+JpKh
         WX0xADbZQy/MXnaHdg6i1DnUbQyudB+TSKlCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868336; x=1697473136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0reFAzRvsauKybkytWT5W1CKofJm2eID7oqapjKx08=;
        b=Ne1KhAXbRIqIuOoLV91GVnSL9EtiKbLH9qoy2pxgA6MXgtuuWr/Ovxqxo01Qtzdi6A
         HXiZv16vsYCKItO4yIXLXZ3GnkGZ67/XNGQ751FHqbRtREAbfSb4Iqokq6iztmwednyX
         0ZxNKPGSXF5Ugne4W/6UoE3yz4Cb1FwKQJ/fsXOyerexe48bzMTFUrnY1ylVyuxhrpYi
         JGsZZfIaqQYQdTnjXcMh9XR/b7I851HWnk/XEpqbWWHrInJyqXoPmTpiLSYBCIE4aA93
         f2pQSUesPi93iiSslTtqQNOalrAtjuXFB8Z/OhLiBC8slftnSLFMw5pqxxz03eERmT7r
         bqTA==
X-Gm-Message-State: AOJu0YwJdPX/ncBPB+TNynE9oW2VOH9o24wR5nb7bzFVEmMd1yfZMRIw
	J5rdTsa6AWovp8amUomglRsLnw==
X-Google-Smtp-Source: AGHT+IGXnFxbwBWQ4z54uFIjZfW6mWOyC97H3o0aqCnpeOHfg+GS9hRTB9FmGO2olXW3iQcatkcdFg==
X-Received: by 2002:a05:6830:4875:b0:6c7:c723:c31c with SMTP id dx21-20020a056830487500b006c7c723c31cmr6665192otb.37.1696868336427;
        Mon, 09 Oct 2023 09:18:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w25-20020a639359000000b00553dcfc2179sm8659990pgm.52.2023.10.09.09.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:18:55 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:18:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>,
	Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] wifi: p54: Annotate struct p54_cal_database with
 __counted_by
Message-ID: <202310090914.A6BAAB9@keescook>
References: <20231006201719.work.356-kees@kernel.org>
 <CAKf6xptEEHJAsrwh_oebK1_AMb+_tvLtiY8sP-Qk=Z9jXhVf7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xptEEHJAsrwh_oebK1_AMb+_tvLtiY8sP-Qk=Z9jXhVf7Q@mail.gmail.com>

On Mon, Oct 09, 2023 at 10:55:32AM -0400, Jason Andryuk wrote:
> This is the function that creates struct p54_cal_database:
> 
> static struct p54_cal_database *p54_convert_db(struct pda_custom_wrapper *src,
>                                                size_t total_len)
> {
>         struct p54_cal_database *dst;
>         size_t payload_len, entries, entry_size, offset;
> 
>         payload_len = le16_to_cpu(src->len);
>         entries = le16_to_cpu(src->entries);
>         entry_size = le16_to_cpu(src->entry_size);
>         offset = le16_to_cpu(src->offset);
>         if (((entries * entry_size + offset) != payload_len) ||
>              (payload_len + sizeof(*src) != total_len))
>                 return NULL;
> 
>         dst = kmalloc(sizeof(*dst) + payload_len, GFP_KERNEL);
>         if (!dst)
>                 return NULL;
> 
>         dst->entries = entries;
>         dst->entry_size = entry_size;
>         dst->offset = offset;
>         dst->len = payload_len;
> 
>         memcpy(dst->data, src->data, payload_len);
>         return dst;
> }
> 
> You can see that kmalloc is performed with `sizeof(*dst) +
> payload_len`, and payload_len is assigned to ->len.
> 
> I don't read Coccinelle, but, if this patch was auto-generated, I
> wonder if the script has an error.

It seems that my Coccinelle script got confused by this:

p54_convert_output_limits():

        priv->output_limit = kmalloc(data[1] *
                sizeof(struct pda_channel_output_limit) +
                sizeof(*priv->output_limit), GFP_KERNEL);

	...

        priv->output_limit->entry_size =
                sizeof(struct pda_channel_output_limit);
        priv->output_limit->len = priv->output_limit->entry_size *
                                  priv->output_limit->entries +
                                  priv->output_limit->offset;

It thought "sizeof(struct pda_channel_output_limit)" was the element
count, since it wasn't able to identify the array member here.

Regardless, I've sent a v2 now. :)

-- 
Kees Cook

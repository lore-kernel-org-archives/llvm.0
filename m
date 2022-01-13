Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A2C9C
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 20:00:48 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id v6so9896019iom.6
        for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 12:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=+bXcVsuUppNYKhF9ZtC6Trbv8FtRnS305N6GIULbySM=;
        b=R5DKTup50Gfl9IeMM2VI0sXMqVCI6jAQ1VCCrulnjDdxtBlxd2jnkFCiaMivfhwbvH
         22r1SW7pjHYmHZKN4rsBsJrFm2NU8krSUBPRUerLberQyIkQkuJX6Kwz0uLubLSyjQy/
         46RChVlrUEsZNIloLoJ8GGbbXCXqrMVIolV6pfEZwcdEQsCeDGSr8Klr+l/yW+xOM7Td
         BUaHx980l8luPOqghwwo92UOi+HVcCi0Dq+ivpGK90EkzermJ45Vk/RrjuO1WADJUUus
         m8SRmsnmRZHKzmW/p/4NfoIByeZjUjaIEbBkva4X4WVI3Pgh3XqV4n3A3KBHzQC5JnPZ
         XChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=+bXcVsuUppNYKhF9ZtC6Trbv8FtRnS305N6GIULbySM=;
        b=ugxYPjtp0J7B3DxkbRAXdA/KrxK/MlUl10i1zRpeJ+7ihjqhC8+fDQ/XgDgkcG/RZD
         VOoJ/K75XI3EvxxReHVwnyqJKAjRlNbcQft0DfW06DIxvWINpGyePtQUX7YTtLEMH5an
         mchz17zOO+g+92eqbVgRlqcvSfloCNnPk8+Hq07W3z+emhtRDgzKtc/3MrhQu1O74j0m
         UcIft4ddfyxmjjaBiJno5x9eSDw1g0U6CIkqdvRKh+MCXYHkakc1w42GacsXBnPPnrok
         OMyiZkC4KMPE84SylENhd75lJw2bXSt5r60ZnP7He+K/A5u7wV3xGzaTwF70j/DZa0bs
         BExg==
X-Gm-Message-State: AOAM533166xQRo7yZpvE+bz/oFb0UYDDQ7DoYjvk0UflARdEIepK/Ze0
	omJG0HlvGp5MYF/Wk+ewb3gPciuq1cgEhw==
X-Google-Smtp-Source: ABdhPJwqANTtW8FxiE2ZK0CCdiycPJ1uIvNavWUQqzW2r03sG7uU/KIYOsUbGKs+I+4yN0BdsqPNpw==
X-Received: by 2002:a05:6602:1409:: with SMTP id t9mr2808021iov.166.1642104048027;
        Thu, 13 Jan 2022 12:00:48 -0800 (PST)
Received: from x1.localdomain ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id n5sm3887025ilk.44.2022.01.13.12.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 12:00:47 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Justin Sanders <justin@coraid.com>, Colin Ian King <colin.i.king@gmail.com>, linux-block@vger.kernel.org
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220113000545.1307091-1-colin.i.king@gmail.com>
References: <20220113000545.1307091-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] aoe: remove redundant assignment on variable n
Message-Id: <164210404746.172546.12306036907222392441.b4-ty@kernel.dk>
Date: Thu, 13 Jan 2022 13:00:47 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 13 Jan 2022 00:05:45 +0000, Colin Ian King wrote:
> The variable n is being bit-wise or'd with a value and reassigned
> before being returned. The update of n is redundant, replace
> the |= operator with | instead. Cleans up clang scan warning:
> 
> drivers/block/aoe/aoecmd.c:125:9: warning: Although the value stored
> to 'n' is used in the enclosing expression, the value is never
> actually read from 'n' [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] aoe: remove redundant assignment on variable n
      commit: a6431e351c6ec5bb6800787d259b343088f369a3

Best regards,
-- 
Jens Axboe



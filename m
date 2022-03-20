Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0EA2116
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 12:45:34 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id p9so17413350wra.12
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 05:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=lDHyOofpwUdCO28uSIzRUWk4WP9iW+8kiFTB04XaHuTEjLl5bpZ4AMfdxWUoSad8yZ
         PznJHK9hAkAlebii2uNEP37MVVFvR4wIie9YCSc0xDITgTR0+CR2z9JXGvUCAI9viqJ7
         Rj3kfPVEnqabw9FugIiUUiniejsjjo51rfkC6AQcMBshXnlJmplWSULRfAURFmqbHLom
         o0rYifXXrgpohUn2hFSaZ75OWY4QcGi7yU4RWY0HtEFfQmVmL4djFArsDal1LGkA6zof
         EQJ9CuPXtdur+lzDeuPk4t5eD3iw/39IIrqZmYKrof6GqpJfy0/tw4b85AodTNNA9WuD
         Bk9w==
X-Gm-Message-State: AOAM531RVPlmtWiEjcBBHmZhqytVwLMxC2AhSvnKrLomht1viRdEil4T
	TnM2d/cor/syLze4fz9QvFA=
X-Google-Smtp-Source: ABdhPJwUhVv8N3+HVdjB9bZ7jwZ3LbfVvveY4iMeQ2qaYFGGp2rir5abMkeDckl1WwU3ljob2dY6iQ==
X-Received: by 2002:adf:f442:0:b0:203:e0ef:32c9 with SMTP id f2-20020adff442000000b00203e0ef32c9mr14947152wrp.53.1647780332577;
        Sun, 20 Mar 2022 05:45:32 -0700 (PDT)
Received: from [10.100.102.14] (46-117-116-119.bb.netvision.net.il. [46.117.116.119])
        by smtp.gmail.com with ESMTPSA id l13-20020adfbd8d000000b002040daf5dffsm1896488wrh.18.2022.03.20.05.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Mar 2022 05:45:31 -0700 (PDT)
Message-ID: <77d616bf-96a0-ce01-7139-1253c414da0f@grimberg.me>
Date: Sun, 20 Mar 2022 14:45:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] nvmet: remove redundant assignment after left shift
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220318013014.90698-1-colin.i.king@gmail.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20220318013014.90698-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

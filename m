Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733233D2
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 17:23:06 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so2859821pjl.0
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWgZ7gEEc8X81PQ76CMhbd301TJwMAVpkYL1Blw7+Zk=;
        b=WD8PFa8hQS4wnu5QtrBDSJ3P1GJkq6Q9cT+r/KhndZ3Tu8+HugHEA8PxWJGSVrNd25
         UfDJVHLnJzB5gGYcYWXYs+Eud6e5dTJDZ8q74pJsR5DcUzZ/rHL8EY3nixbeXRDN8HO3
         FFS5AziGVV/tYAy8f5Ly8XC/HLPXc6pvIb5BASUo6+NcypcrS+9duVarrYGjhHc46l1R
         Qhme2QRMC/1Vpn5xDgzumZK2bUtfKUgKz+czRDIcWGsqldDKTvjZmCqIaOUGy5wiEZcv
         z2QhcXvN/fRqt+NKLMi5j+tX2s+9ek//8w8hUwrI6Z2sK1pVqDWhqVbuniCMHaoUt4kU
         oFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWgZ7gEEc8X81PQ76CMhbd301TJwMAVpkYL1Blw7+Zk=;
        b=z/ERFT/ssiL7JTqWc56byRnKCSibfWZMzGC9aNsyBUBjyKCr1eBJD7H/4vbDlVf3n8
         KkMP8deHkUwITbziJkrSUFKpBRtFMQHFtLoxZ3cHaHh1YToNWMNzs2YEjhTGAI3QxNFA
         6Vifjydy/WHCqebEnK+ePcJEKwiNDMsV5GzRzlvUW0V29aZgtJtursNNuYXMAwrAnBM4
         rX0qmf9v1tVX0b2MrZImvAHefbQYCnEDLnM27Keg7T8PVK0LBeiE/IIRRtwe8s3BzY2b
         gIVOGAsHOu5gUy2YQRTn1KOLKhdaHK+xK35DJyyS6vY4oihN6NIGWWpMzyVRmEME+Ufh
         XGCQ==
X-Gm-Message-State: AFqh2krvGtygwpitsJw7OEPY0TfiHtY/ixgvKBWSuN5Q2ddd6h8JBh8a
	u86344pMGwqYLGoowCrTBPMOtg==
X-Google-Smtp-Source: AMrXdXsJli37LpeR+Ut9dL6CmRUEVfCSe8QSBjABC+clmVX45J5X5gNTWEC6/HhSq6xnbHOHLH0oow==
X-Received: by 2002:a17:90b:f90:b0:227:b29:ae56 with SMTP id ft16-20020a17090b0f9000b002270b29ae56mr12731828pjb.1.1673457785758;
        Wed, 11 Jan 2023 09:23:05 -0800 (PST)
Received: from google.com ([2620:15c:2d1:203:a5cc:f0f5:1fc6:713])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090ab01500b00226eadf094dsm8670970pjq.30.2023.01.11.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 09:23:05 -0800 (PST)
Date: Wed, 11 Jan 2023 09:22:58 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Bean Huo <beanhuo@iokpp.de>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, beanhuo@micron.com, bvanassche@acm.org,
	quic_cang@quicinc.com, quic_xiaosenh@quicinc.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: bsg: Fix sometimes-uninitialized
 warnings
Message-ID: <20230111172258.pzzvjzuxczkfiojj@google.com>
References: <20230108224057.354438-1-beanhuo@iokpp.de>
 <20230108224057.354438-2-beanhuo@iokpp.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108224057.354438-2-beanhuo@iokpp.de>

On Sun, Jan 08, 2023 at 11:40:55PM +0100, Bean Huo wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> Compilation complains that two possible variables are used without
> initialization:
> 
> drivers/ufs/core/ufs_bsg.c:112:6: warning: variable 'sg_cnt' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> drivers/ufs/core/ufs_bsg.c:112:6: warning: variable 'sg_list' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> 
> Fix both warnings by adding initialization with sg_cnt = 0, sg_list = NULL.
> 
> Fixes: 6ff265fc5ef6 ("scsi: ufs: core: bsg: Add advanced RPMB support in ufs_bsg")
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Xiaosen He <quic_xiaosenh@quicinc.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

We also got a report from KernelCI:

Link: https://lore.kernel.org/llvm/63be5f73.170a0220.16f9f.8b91@mx.google.com/
Reported-by: kernelci.org bot <bot@kernelci.org>

> ---
>  drivers/ufs/core/ufs_bsg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
> index 0044029bcf7b..0d38e7fa34cc 100644
> --- a/drivers/ufs/core/ufs_bsg.c
> +++ b/drivers/ufs/core/ufs_bsg.c
> @@ -70,9 +70,9 @@ static int ufs_bsg_exec_advanced_rpmb_req(struct ufs_hba *hba, struct bsg_job *j
>  	struct ufs_rpmb_reply *rpmb_reply = job->reply;
>  	struct bsg_buffer *payload = NULL;
>  	enum dma_data_direction dir;
> -	struct scatterlist *sg_list;
> +	struct scatterlist *sg_list = NULL;
>  	int rpmb_req_type;
> -	int sg_cnt;
> +	int sg_cnt = 0;
>  	int ret;
>  	int data_len;
>  
> -- 
> 2.25.1
> 
> 

Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571424644C;
	Mon,  5 Feb 2024 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154897; cv=none; b=lyoZxrAA04KHc5D4OskB8rUPDU0LrSzXFQkKWUpqrjcazH8v0NppnX5n0FRviHM/zVDgZh7XYFxS+BbPifwxYNDZJGuhKR9UhwnqAL+g+V4kvgAZd2i9gHqea4/GYM8FsbdX2SDN5xtZC36EMzewhiuH9IQquX6boORZ9AFkQwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154897; c=relaxed/simple;
	bh=YChhHsbcujQFIcf7V0PBBnQi8++njW9XmpXYVj+1wSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdtwH4vK3B38QkTlxjen1lUl8JypNiSQLLqVHh77Kwb8wlejpZokfiKuOmUzegLIiO37b7iFqQlS2uLekYNFNfAk7TA0pSvUyAErXBOxr1rfF1zprZ7RUqGBYwKR3Db6D0Pev2EGo2Z1tazZFN+dhRzS2ptznozoeayrNPBnyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL9O1yVm; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL9O1yVm"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso3941772a12.2;
        Mon, 05 Feb 2024 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707154895; x=1707759695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5wEw2pIqKMER/ytlm8qV6OP9Ve1OSfzYNi3uU1WVTE=;
        b=EL9O1yVmHhSrFYckXfTwvPz7XtEoRP+q+LWtW2+BF9jCPbc+t+BfU2cGKdRedXtuGT
         VGSRliKUq55XIfE8dwKdkC82D0WF0hcffQLggaHUbyJa/zLkjV9abRomBTUeOtzEsIS2
         bp6c9lp//8ORYnEFTDxT0T1YIXLDtomJgUrHMIxHtnfuiq34/kQbt2EopIUMNb8RnY79
         iqrxilwioELS5XEPt1R6WbUAo/bXEmBJId4TORj/wGRhmBApC3gHsU1+dvm9f71b6bCA
         kuEQc+MMGLFxVlm23CPWqSs6cUTDPjNi9yA6ATC2rShe8vcT+6gY8pqqfvyAu2kgh16B
         pQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154895; x=1707759695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5wEw2pIqKMER/ytlm8qV6OP9Ve1OSfzYNi3uU1WVTE=;
        b=S7Lh/qCpq+q16Hlh1bdFlMKaYa5oYvpFYLrB+xDykzYZqH22m/wxSF55vE6OZZXQS5
         ZfGSGelkDx/XmzVkIsqAf56AVYhRB4j/dcwsA8jrzhppVDIO3PdxIUSAZssp+hZaxlq7
         coEibx6/HoYgrY7bfsQCiYM5odFQFxSygWPbnj8G2Kx/VBx+oyB0PLFDxvXJzINhjIjE
         +lUnYaDOB+xq0YX7txk0dhcb1NHVUqJ4PvlnRs5B3sNqGbB15y7lEcrNnQyh2+4/u8zP
         jFiQ/e4433GYcpcxJVn5cWITacHa+HjS0hqnaXLx3yUWuqtmi74fsVjmVENaM70W3EX+
         gM+Q==
X-Gm-Message-State: AOJu0Yx+ALgkVxHbMbTNhZyt8CnfVFtSd29hsACpjh0YGI++mlTTIfo7
	lOFwJ7jRdF1THfcc1er2MOl2gaFoQpXAQRitKYf6vy3KQoUMZecO3WuJEfshl84=
X-Google-Smtp-Source: AGHT+IEKOp7NGwUbOkUId1UQrtyxxtooS73qEU49s7hvFLxBqrp33Pccemlyq0zEYKNZ77hdjBkeTQ==
X-Received: by 2002:a05:6a20:a127:b0:19c:8ed6:8bb5 with SMTP id q39-20020a056a20a12700b0019c8ed68bb5mr250021pzk.39.1707154895255;
        Mon, 05 Feb 2024 09:41:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVIxFZP+oizRtz9SZTNa5aMJ79aLujR7gAB6ZPepA1AGfGJG13MWnGSlNj+hKlEOSfaXuHLDcjAiKgsUZdqsVmf93po1kqZEkh5uuvX1kry6YR5pt3IqeFBYw4l/fKWHQ2wjZ+MiZpbFrvkF6WNMqSnn5Q4H1I8LGFYOdM7fTLzt3hZ9yOmxI545Q==
Received: from localhost (dhcp-141-239-144-21.hawaiiantel.net. [141.239.144.21])
        by smtp.gmail.com with ESMTPSA id b6-20020aa78706000000b006e050644092sm113598pfo.55.2024.02.05.09.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:41:34 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 5 Feb 2024 07:41:33 -1000
From: Tejun Heo <tj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [PATCH wq/for-6.9] Revert "workqueue: make wq_subsys const"
Message-ID: <ZcEdzUle0VZZNkAo@slm.duckdns.org>
References: <202402051505.kM9Rr3CJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402051505.kM9Rr3CJ-lkp@intel.com>

From 4f19b8e01e2fb6c97d4307abb7bde4d34a1e601e Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 5 Feb 2024 07:18:08 -1000

This reverts commit d412ace11144aa2bf692c7cf9778351efc15c827. This leads to
build failures as it depends on a driver-core commit 32f78abe59c7 ("driver
core: bus: constantify subsys_register() calls"). Let's drop it from wq tree
and route it through driver-core tree.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402051505.kM9Rr3CJ-lkp@intel.com/
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 78b4b992e1a3..524a7fff52af 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6874,7 +6874,7 @@ static struct device_attribute wq_sysfs_unbound_attrs[] = {
 	__ATTR_NULL,
 };
 
-static const struct bus_type wq_subsys = {
+static struct bus_type wq_subsys = {
 	.name				= "workqueue",
 	.dev_groups			= wq_sysfs_groups,
 };
-- 
2.43.0


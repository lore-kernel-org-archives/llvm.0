Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535E3224
	for <llvm@lists.linux.dev>; Fri, 29 Nov 2024 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915992; cv=none; b=rynvC+LXGQUGYc/J0d/Cd56ICFoiylPSR1ApNDJvkuA5cufsniGeIiBgwagezzSF23umOc3C1yGfcY3aTJ6X3tzP2Luf5Ek/MuL4LpAQl/FoVnmW03oMl0KeBUW9elSBdLULns3xEzgw89p2mqW67gGkKX8zIqXjzLE5ab1A4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915992; c=relaxed/simple;
	bh=GB0YHpHpIaFm2Gqo1CgIM/+zrAtRch8fotoPrHeHKhs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VWLmp3IpOJ9G1loll2qKkJVaCYGI1l/Ec+y8tIrn4iWiICTTdejXowhYjPpaMjbn64MWV+yStVHa5ekFfZnPkspmmxW3eQXbo6sEBukzcpt8jbASiVvhH3wj12Mpm2+UAc597NIN77RlGz99e8FS5m8G3AJnxLPCFr8GOMhShKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HfRbgpDG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HfRbgpDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732915989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+/FOe4ty+7d1AV31MLnuulQX6gJAqlvCU7go8OgDug=;
	b=HfRbgpDGZxiaNTa9owiwBBtFCrgw8xrQeRImsqbTzKIr90cY5aC97Bk6xhX4KZYbkhFUlR
	NEgcWdpwgJNcC0Gg9QEipDTiB0bfkx8iDYxkW/gGznkuzPSEPYy2Lw6MMI4HJlWueBDeUx
	nSUNHtSu8VGakUFMHmRfD4lvZGzdQE4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509--FIqo7buNxSDcELay4C_vw-1; Fri,
 29 Nov 2024 16:33:06 -0500
X-MC-Unique: -FIqo7buNxSDcELay4C_vw-1
X-Mimecast-MFC-AGG-ID: -FIqo7buNxSDcELay4C_vw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FB95195608F
	for <llvm@lists.linux.dev>; Fri, 29 Nov 2024 21:33:05 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C26C0195608A;
	Fri, 29 Nov 2024 21:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 2eff01ee)
Date: Fri, 29 Nov 2024 21:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <85232.124112916330600370@us-mta-509.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: As-w9SX0NMcWb7_4EgPiZFr2vWZSb4CwkpQLWZag1lk_1732915985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'char-misc-6.13-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gregkh/char-misc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1566556580

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1566556580-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1566556580-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1566556580-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9414B959
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482591; cv=none; b=BlRlVgt+iGvknnyOVebr+/LV17Xjic7n6PCUip7VJtW87pAsZUq7agQh0iaxurjo1FomiCoJgsMk2uM7nv8JqbPIzxLIcRLaW77GLBdNnDloSUgrTYC2KgyxDBPZBTbkJHU+5w36UYLLUtxJmZvY2fyB/wP4UPbqNgmO8KdXUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482591; c=relaxed/simple;
	bh=O1XutNxQp3cMMJZWpNXrBgb0aR/rKta+1KtO9F2vhwE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mC9DWetdBwoK2XW3PKdlk7j01FMAl6eMAI03cmFQBRPZULFK05UVN/4l1s8Bl+KBCDaGxM++0I+o+p/fENSbicpY9jIcQ1WOu8fOogAofCTZilHjZVtCFc5isd+KFGk9my/EC5TM7Wbl+C05OFT93R5eeg0ZYyiG4dW6YRaTga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ma2U3xJV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ma2U3xJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749482589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Stkv4zYiIdJOA/P6fXWFvmc34iMjYC6AEKShKvXYCI=;
	b=Ma2U3xJVGAC5LvQuUhUORgKqPe1y+9gJhX3cAsQwmrnn8nSSi7fdKfpNCm1j+3mEAECnq0
	ML/FmrekMCvYfuAG1wg8jJ1iOiJZk0lj5QtcaAgcC9jxzFcP1ZLH+Uvvu9/3Wm0jiMcfVV
	GehCE7nDZygB32HNNjqYyoJ4EM5wkmI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-tA2wIoU4OOGy2EDKjLcZGA-1; Mon,
 09 Jun 2025 11:23:07 -0400
X-MC-Unique: tA2wIoU4OOGy2EDKjLcZGA-1
X-Mimecast-MFC-AGG-ID: tA2wIoU4OOGy2EDKjLcZGA_1749482587
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BFF518089B8
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 15:23:07 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9308919560AB;
	Mon,  9 Jun 2025 15:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 3 of 100): Test report for master
 (6.16.0-rc1, upstream-mainline, 19272b37)
Date: Mon, 09 Jun 2025 15:23:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <98437.125060911230702907@us-mta-351.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Odvocr7vwQXyb9wj-pU0X4x0a-zgVN8a6lm3e_UkVRE_1749482587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Linux 6.16-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1859594038

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - nfsv4.2 [x86_64]


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


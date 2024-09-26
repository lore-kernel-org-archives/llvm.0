Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE51114
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360165; cv=none; b=juvFImPeVlfkG6/mMXiHYaJLoJ8PmHkUlbP9ts4Nui3u6W1b1X7k7+9Tmm1S8btUPF+/eQaHo7OsTcwCxGvM1YInTDyC1V+QaZ6VOov3hVKVgc4l0xgnEJLE+MDa0q2mqqR8J36e1JAr16j5FTD9Jd3tNI91IJPDaX59sfSNYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360165; c=relaxed/simple;
	bh=ZJ/B9UxLYNveas3KE5QpifgaqS/H/MxttLEmVxM1/UI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lYfIb0z3hvUrsC/8lWDIHOQ873gam/+iMxRnaSxuG/62xF1EErReojf+y8h+4n1JIE+hjV0KOvoxpuka5pqjGhmond5cTJOA46Sz9pFuw2qNcU6MpnjHM5p+cqFz8YsKOhIGkZwlqT5cYqIcZ11PHdJAM99RpMr5zplRZ85dnMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh/xXc/n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh/xXc/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QFxJIE2W2xQ2AxlSncv0Tc2hhTlBmSS3hkJ/Y4vl1FQ=;
	b=Hh/xXc/nnMARlPJdDMMutWJs2ot9/jvR/RVdlMMm+4xpTPyl4q5Ux3hsiM5UBEPVxUdADs
	ZGYQrSGwO1Qrb69sFewYZpjrNFo6zHBlT3g9MCyjiKI0lwY4s+hZSJbCzMztCdeBFl1AsU
	NGxxh4ZVesWQacKRGj1WenlbSsX5Asc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-5MdiraGWNSuJecvTm-792g-1; Thu,
 26 Sep 2024 10:16:02 -0400
X-MC-Unique: 5MdiraGWNSuJecvTm-792g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5623E1944B3C
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:01 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 08B7C1944B21;
	Thu, 26 Sep 2024 14:16:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, b7718454)
Date: Thu, 26 Sep 2024 14:16:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <22261.124092610160200687@us-mta-609.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.11-fixes-4' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1453070719

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1453070719-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1453070719-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1453070719-x86_64-kernel-debug


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


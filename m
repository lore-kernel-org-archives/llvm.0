Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DB13049E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360052; cv=none; b=ZGdxa0rKJJDYBmIGPh9KZ35M5VucmS3HTCGoixFQML7xAu2d/tsib2qOqiugR4l3Zecp4PrdzwwwhYXkZJoKQzlMNIYJ07Q2a00NAHD7N5aN7Utqe221Z7pcmrxSxDM2Hwkft+G3RbnqQTEAdmO+Sr5Bp2BGV1u9/JXaCE8sumg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360052; c=relaxed/simple;
	bh=zB0QvoG3VzOb4DnoMzkQ2zsePW1bqi461r+WzF8eXjo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MdklyPfOAp5s+21BO9vK3292KDVJv1i6X6TaIi4SgDP7gfq8AFe2PwVpuEsayZ90XRHC+HDhZxA29csxB/x0Ej+EoPgYQ/leB26wftH3wbbHBruN0D/99DEPCWwuCub2DjImiSPToUHmsnD29gSszjCX3TrnlrL6rdJyY4MTNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J6w+Ut4+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J6w+Ut4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DH+G9bKRq6/jXq3RzCigYb12OGbn2jIfAqpbapUadl4=;
	b=J6w+Ut4+X+bF5zoW0m5vSioW4G3MhvzkcyKLhiNr9cL5D55SC1HxbOFgOkpT05kYKE5AmD
	5KPlfz7V+L+gdUR8/3ELdoIxOtRmKeDSEZN+7MsGqpDBzJQaHtX6BEuvMK8lVobautwhwp
	wxaDkGQI9llW86DrvgDbdpfiDok+Bow=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-zKkZ6V-BOgy2WUhjFEam0w-1; Thu,
 26 Sep 2024 10:14:08 -0400
X-MC-Unique: zKkZ6V-BOgy2WUhjFEam0w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA9091944A88
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:03 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 968A21944D16;
	Thu, 26 Sep 2024 14:14:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 1ec6d097)
Date: Thu, 26 Sep 2024 14:14:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <53118.124092610140801399@us-mta-360.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 's390-6.12-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1463460265

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463460265-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463460265-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1463460265-x86_64-kernel-debug


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


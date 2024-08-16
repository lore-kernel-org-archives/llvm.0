Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A1B664
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723840333; cv=none; b=ktE3f7vf74XGp5XvO+UyBsM3NG7qjsTS/LVYLgfWSaOSE9ZY08PdU+TOD3fPsWvGAJwE3bItGiT1Vf/zEt+Jmn+/nITa3K2HSjZ3j/FdGCY3f/lC7Jw1DBs8/3Z5QWG20LURjFYHIyo/y/PaC3NJ9/uiz6Wt0i4CC3z56qlYkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723840333; c=relaxed/simple;
	bh=Y3Aar85IRX6Ogk9R3TRoc2AnAHRlYJzvpl8T9KEI3wU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kkeUiI8LfazgIfsQRr4ka3skTBUSF1gMywCkeUGH0bfwH1v7HNI3CHHZ5LB6ClBtnpS358GA39JmqW4Ieo5MHGu7ailT71IcYgy4HcjVKb7S1k9y4D0wmv4zZxJa5pWoP6O+CWxXHy+dXZWl6v/YaxzaNUKlHAXIAQUEEiOyS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3P1SmVq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3P1SmVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723840329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zPcBmJryJhjNTlMnrjjdUq4Bwj8PTNUkl1+flNgS+MU=;
	b=S3P1SmVq2Df4QtiMeoccyOPrlc5vBADP4N028efqqjVRdQ7vZgFni1nQdoBb3Q3KByyjs2
	rqExTiWxV2oC4Cw/qn2wNHZK/Dn5NctZjhiGYqiqmUUtsb96JBO8ot2BeBKnUjHJ5r4H7q
	bzck401Fndk86yAJhhUnqUFNvV1yCG8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-Fa38_WTVMT2I1YiheXGl3A-1; Fri,
 16 Aug 2024 16:32:07 -0400
X-MC-Unique: Fa38_WTVMT2I1YiheXGl3A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97A7F1955D47
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 20:32:06 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF9801954B1A;
	Fri, 16 Aug 2024 20:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, 60cb1da6)
Date: Fri, 16 Aug 2024 20:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <38520.124081616320703723@us-mta-326.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-fixes-6.11' of https://github.com/Rust-=
for-Linux/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1416395862

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416395862-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416395862-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1416395862-x86_64-kernel-debug


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


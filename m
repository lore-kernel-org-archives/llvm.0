Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A23EA98
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724205787; cv=none; b=ham30HkrvrgtHGLz9GReoWmvZfLLyK5qXV0Jh+cR/m40CRloAo1XNFLyS2MD5hCt5O+IZYOFAD1gjCl2tUrr4I1DxDHUK6xtGLzdNngTQ1KpTZMW98xj/IYc31hoOoHRTBwk9MnfvUyrfDCNhzF3VgAUvnsg/oBXjV8MofyR+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724205787; c=relaxed/simple;
	bh=gzvQdhqXlVqEdYiWOOyNursEA2b60q9YSwyAAmoFtu4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iJUOmFYiekMpjYc2daJ+TkpWfrZ/G3dVZ6vM1sma7alAF2nemQ5VIC5vjLDHim6a96l0Jw6gBC35oeDDQMUPWjTBarJDm5Xsz8c0Py4bNGpbwGOXbz+N0lk7bJ0XBcaO1+MfCRRWX5jPW7KuqgZLMemCDyvqjvXWgfm19r4C3n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4pyRRj4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4pyRRj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724205784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zskPI0txAzPzOrjVks6Ff/2c6oY3pKw3PlTRdyXXLYI=;
	b=O4pyRRj4bHxYYM8uCKlR4uHOxTcHGom82EyUM6VxFXtj/88yaveogZiCo29VLkf1QlYUzw
	68a3lW0q6WoVl2YJ9bkkYmyRwlPkHcHsS/1KgpWJbvzUm8pVNX13NvOcXGpPB8R6ghH/gO
	G1Fw9rLCF18NPNxB39+k8sei5T3v8wY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-_8pWr56ZPLWhNM-p9opWzw-1; Tue,
 20 Aug 2024 22:03:03 -0400
X-MC-Unique: _8pWr56ZPLWhNM-p9opWzw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A9D11956080
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 02:03:02 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74AC31955F45;
	Wed, 21 Aug 2024 02:03:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 0108b7be)
Date: Wed, 21 Aug 2024 02:03:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <84344.124082022030300284@us-mta-538.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus-iommufd' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/jgg/iommufd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1420675793

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1420675793-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1420675793-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1420675793-x86_64-kernel-debug


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


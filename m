Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C32C18C
	for <llvm@lists.linux.dev>; Fri, 29 Nov 2024 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732920131; cv=none; b=CnAz+ofkz9xtlInwZY2/9FOSDKxHZkzgEN4G1BklSDoSox7yTbLcGXsLf93FqWjVfI+las0yZQzvOj6zZbdJBFdyLN52dQCbmFotRj2Gcb4zK0QpGHoExCjY+y2rqZhmWHEpEP2O/YvOJOBeFU3I79hipH/BNPfWQf9Tc/V43Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732920131; c=relaxed/simple;
	bh=krvDU7LFwTs4/YY6TbZq0YylNZJaLLiqNvDPEgeuBr8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NPXv2NkYP8zhdef3V5gNRpV4L27osxkSXXNY8nEXwSbrQdNgo+Fm8F9c2kKYu1ix1HVIJcQyh5BLY0IxcgSnvlo4phMz80+xhEGNZJFTR4VKEyivPbqDg5CXQzCTIdpqRNXejDfqmAZ9pK+rqG2cCY9dgDa27oofNtF0ayhcaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5lIE4cD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5lIE4cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732920129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iQnttCTzYINOsNX5ytPu80axRYsQ2wDMKG+JkJXzbMg=;
	b=C5lIE4cD+KJN+ZBuBHvHAOpoWNWT473Y7fN6rqQqK3WuY1xywiW5adTXPwTdR1aleXz2+m
	P8Lh5LZt3rBM8k8axwddMGTbm/SOyEprYD7pyoca8fWBX3WPyvto4Vyhv1zabJn+FbAR0Q
	SmRXV6ch8DBExSVnK/MgzOWuTlqF6lE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-307-7Q3Zq5XUPHKiSE9qQrcmbA-1; Fri,
 29 Nov 2024 17:42:07 -0500
X-MC-Unique: 7Q3Zq5XUPHKiSE9qQrcmbA-1
X-Mimecast-MFC-AGG-ID: 7Q3Zq5XUPHKiSE9qQrcmbA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0BB619560A7
	for <llvm@lists.linux.dev>; Fri, 29 Nov 2024 22:42:06 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B2E130001A5;
	Fri, 29 Nov 2024 22:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 2ba9f676)
Date: Fri, 29 Nov 2024 22:42:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <18796.124112917420700301@us-mta-307.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JEEjvNo4S2w6LTappwcXVLeK2D4XGlDRVij55kjP2FE_1732920127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-next-2024-11-29' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1566594267

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1566594267-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1566594267-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1566594267-x86_64-kernel-debug


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


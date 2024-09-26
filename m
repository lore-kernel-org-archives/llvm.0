Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27F1CA81
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360066; cv=none; b=at+t/TA/3Ftzyxdw1wLIWG6v2c1DljNkzmG2+RaYlYW7WUtHMRE8+anL4yjTtT7HNy7FQH98yi5TpJjbCOCCS9Svw84vAqmRpmIBkMDTY8wfjgHjITSovZk9JOJYGRj9DwRpDdlxbnWOjyECUdvDp9+hAxlPZ9fz+ks+T/4dU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360066; c=relaxed/simple;
	bh=BjtZi4ridepdCaoA44aw+HLXcqen0O3LwKQ/2Svp5sM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c9aIUAhsXPzgNHgYC0ov/4pgBt1b/dP5gkzG+COR7u0ANXuHclhkJ8plNx5/FKA8JFqsIaIY7pj58basXdBvbW5LDbo+Tk3vUvmI9rXZOKkR2PqnLVhsH9C2MRLdeeHRxHQd7NIb4DzJ0Lt41sEY6mmUvLl1Aox0BcXf8QlMy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fyv8z1Wc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fyv8z1Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9gblOoykJNWVHILm/NrpqFCE5VzKEJv4K1ktHRWpWx4=;
	b=Fyv8z1Wc8ZDARSGoOBQI+YJPELbzjdji0gfZ125M8BcdThHDtX7T+n7d7j+/oGPvS9PFT3
	dZZ07qEWYSikWzp+oSdHn4kB+dS+jI7xksgHhBydEea4+Mde10BBSaJu2aV5QrFIlskTL4
	YgUl/wrfNImVEufn7QxEOLYFXzUFhQo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-c_NRdVpTPgK8gangabogPA-1; Thu,
 26 Sep 2024 10:14:23 -0400
X-MC-Unique: c_NRdVpTPgK8gangabogPA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50ADD19137BD
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:22 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ECCD33003E40;
	Thu, 26 Sep 2024 14:14:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 839c4f59)
Date: Thu, 26 Sep 2024 14:14:21 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <38565.124092610142300983@us-mta-558.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-hotfixes-stable-2024-09-19-00-31' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1460241153

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460241153-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460241153-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1460241153-x86_64-kernel-debug


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


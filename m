Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B051114
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360244; cv=none; b=EEsLFr2Hl/hHZovtz5/wWsnC3xXShXuzLP1ip6SC+NRPVrpnre3pyWidIg+y9jK7T3LXLke1EjkXoWAh1/6FMheI2eryxNqtuRjlYGNB9DEdX4wkOiuYHHzMoSSSlxwPdiqoN3JIGCzvEd8WE+o4BWDCPog3GQbbnQm6/vzzHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360244; c=relaxed/simple;
	bh=L6PtKkl6G8ZyPGdDj1Wb5pd+R75+a31cw0XBpyaC0no=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uWxvk0cIVAlmy/17RLRAfoD5Bt3bnZgvZu1AZcrnBHK40StLyrfQu+sLcfEqvM9iQKKpiq3lzznLeyjC61MFZyd6aznXFphTxrVNgBRwPI0edSzzOp0eiEJzguzyfKyZ/R3EDERa9G3iDbJWOd9MFDrvIQNiBb68kC/z+HE/fck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f03FcjqI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f03FcjqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqhj9GUq3YwvAavRGj5OiGYhOBiraehpjvFY3HXn6xk=;
	b=f03FcjqInhUTbpzz/qZIq43oym5yPsWs/Sq3IENexpp4U1K7l2xgNGWzD5COZ8SttWWsWM
	uevDojVOLb6i//N1WnmFjGOEC1Ex37PMXeZwEHe0VEMMsfQYaa5nt4SfUwK6Ik5geZNbZE
	4PkKOeIDLwVjUdv6t3anfyYtLOvPDHM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-552-lTagSPuHPhuq1Zuonfg2Gg-1; Thu,
 26 Sep 2024 10:17:20 -0400
X-MC-Unique: lTagSPuHPhuq1Zuonfg2Gg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE8A118B0943
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:17:19 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B91C1954B10;
	Thu, 26 Sep 2024 14:17:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, 77f58789)
Date: Thu, 26 Sep 2024 14:17:19 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <86959.124092610172001513@us-mta-552.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'arm-fixes-6.11-3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1449658370

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1449658370-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1449658370-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1449658370-x86_64-kernel-debug


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


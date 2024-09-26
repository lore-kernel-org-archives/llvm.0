Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386667A0D
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360084; cv=none; b=G3cE+9DsZeWsDRyAckHDX4KyHqG9Jd8DOedCtwOOVD7iZhRijGp77imnQ6atfRRHtO1/iSOHoHlfwnYaEusSz3Hb4qamE+SRbD7v6WeV5DLi4X6H5+e6DYEZygtoL73GAyUz09Xi/KH8xn/S54TZhbeR4K2VSI9cFbm75SR58fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360084; c=relaxed/simple;
	bh=0NbC0N9ofiW1vQZwtZMKk4NTV0p18KZFCLZvmUuMUp4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=AP0onzPnpO2CHyuJl3MqgBbfldO8XYiXRuaRBs+VrpQBXCGmlRudJ5Jog4VnPkZbJdAPpH2i5N6Whhj1z0o4teaoJrT6aD4BGtQVJeKUd3DPVPM/XrqZcgT6bNv90IMnUo3NOuHy5x8AA9a6i74utAxwnUsF7aXnrGs6Z1RFLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1qYDNMv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1qYDNMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3shhKGtHm+1rn6pkXS+WJXqpSw0KXIM/wYDF4Ft1v0=;
	b=g1qYDNMvIuxvm8/Vlrp/k0f4VCSWmkdEG5pplyq58Taj4S84M9+G2tT4aBscokMaKkXvip
	afQT2RwL/wVsG6V1QJEdkbyrOJUbIafjMAHB0fKJgLmA1C6JH8LBXfgeugEC29rfBzdy6u
	DQPjQekP/okGDGs0b6CJgm1POP1YNN8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-QcE6awkzPhejfHD22xVT1g-1; Thu,
 26 Sep 2024 10:14:40 -0400
X-MC-Unique: QcE6awkzPhejfHD22xVT1g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FC2119371E2
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:40 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B14A53003DF2;
	Thu, 26 Sep 2024 14:14:39 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 200289db)
Date: Thu, 26 Sep 2024 14:14:39 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <77632.124092610144100239@us-mta-321.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pmdomain-v6.12' of git://git.kernel.org/pub/=
scm/linux/kernel/git/ulfh/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1458321590

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458321590-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458321590-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1458321590-x86_64-kernel-debug


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412AB640
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 00:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723769530; cv=none; b=NKtRoLE9ERZwDHGSr5wTSuIkB9xnP4yWgrxr0U7SV4aWVOb/yPpAyQmqeHqesJEYRyNAtND62RL/RspUQon+19Tfcq8puDwZcalcw0YNCBjNYUszW6wa9QBdwch0QUaC1DroOqUq6SbPtEzDm9SHy18H8p6WrzCunDlNytxS1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723769530; c=relaxed/simple;
	bh=1vEDZz1SI9juBArN17bLXSBYvCJWwpkB0+vOIrE9phc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=b5pEeDmcxKqiMwE6FLIGw7EbNx2nWmHgswjWY7eQ7nA4PcqmRK2/kMsZ4JlWgW+ByUwaZN5gAvcHOcw9Q+NdAZ7E/z2x6S/dLtsxQMIKkTXPv4z8H57u0pBoyBVRZ2PbWWz1+gCYzQT7iWtgx2rEgX/3S9pDMZJcYafO/KPXUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKIzTunh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKIzTunh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723769527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QfW2/c29dgLIp6aAeoUkmN9Q/nkI1V++HTwPVDtAfto=;
	b=VKIzTunhvctsHs0fevjhRwMwfiHV1kZbrmuQEp+2FL7hvnwl87pGA3+oWSiQKYr4QfOrYe
	fWLaV0gZ93dER7r23Ziokeo7QpCgL1Ghf7SRDCYf0l8GIwd+Exkt1MU2AJdIRt7fJ0eFsU
	NDUZKqriTEQ+9Q5RcT6UZRZkmkStdUY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-Q7RU1m-3PCqBE82EeLml7Q-1; Thu,
 15 Aug 2024 20:52:05 -0400
X-MC-Unique: Q7RU1m-3PCqBE82EeLml7Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E1AE19560A6
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 00:52:05 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72C7E19560AA;
	Fri, 16 Aug 2024 00:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, d7a5aa4b)
Date: Fri, 16 Aug 2024 00:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <50941.124081520520600149@us-mta-662.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'perf-tools-fixes-for-v6.11-2024-08-15' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1415327647

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1415327647-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1415327647-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1415327647-x86_64-kernel-debug


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


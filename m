Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BD185B48
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 20:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729282930; cv=none; b=Ht6dFyW8gUmnh+rLTu0NwmKj2SMS4jxVRNZLPiCVjxL/JLSAG12ywhancMj3hG3BI3axcbezV8dgCiMZbhWWPLqOtp65QKbazY1Q02mTChHMAgsz1pa6uJkI25mwKfTmOkA/NDHBfRu/trFNo2/ZFFaM7WFg+0ASCEsqDEPfUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729282930; c=relaxed/simple;
	bh=antgJ3Xp3rgYbVPcADmQkPP1r8BVNmXqnFrHfEp4DEs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=U5uQpKjzq3SCH+FY5IWrzNdmDSj1e5xT39RHy1gKFKwmS6cEoCFwUxOp1djIVg3iqpjo+TFm8sT9Hho2CQvYyidHWcGHUQyjMXrL9u/JuqUtfgodR8aY4/n/l+PEkpA2U7Pyj1MxGaK32lL1QdyUmWRSCwBqGEf33A8QdwEa8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhqGSQn/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhqGSQn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729282927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IlComLjBLDKFHYcdED0Y3YzrqXsKXxUStfek81qm/zI=;
	b=JhqGSQn/lzxoO5NiechBixGVnZ7FFyOw6x+0bq9eznUvr13OztNAVgPQ/ac2LmwFf9AMsm
	F6WMjndZf0dIlUrStDaDaCzCV9Z6XNBpTJZhnQGsNPpRGxw26WVnEmrkIZJVXcFB4rqzB8
	FQqCY6JR1lB1FeUKPskbTc6GW5+nylk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-340-boyRT0XEPLCS_EHjvQ92UA-1; Fri,
 18 Oct 2024 16:22:05 -0400
X-MC-Unique: boyRT0XEPLCS_EHjvQ92UA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2096195608B
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 20:22:04 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DFD0195607C;
	Fri, 18 Oct 2024 20:22:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, b04ae0f4)
Date: Fri, 18 Oct 2024 20:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <88423.124101816220500855@us-mta-340.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.12-rc3-smb3-client-fixes' of git://git.sa=
mba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1502733305

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502733305-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502733305-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1502733305-x86_64-kernel-debug


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


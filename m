Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DC4689
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731112987; cv=none; b=Yu86XF1C0oalQVB+J1Sn6gL0QOW1Bo+H7tDjUOasgEjwHW/pxxYpZcwn4UNSlhkx9u0rHrBer68XQqUrVdkp1OvKa+JrKmUnPGg//1NijS+NC3WOw0xH2FzcTs+rynCczmE9iqgrOdjPJzEpdr5PR8Ue1FWzg1OreqnSKoaZ3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731112987; c=relaxed/simple;
	bh=BOrqVVV4OEjm3K3N4ryDrz/EmXD5cSBqonTnVs7gj/M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fHzuGkg4AdHhg5uulc6fgVYjJi8ZQetnaBYl2Bcryr03/dOLKefdS3ykEzKB6+7y519H3vUeYlPdNEzIfiqYlFheoJy0Pnnfw5b0X9PYmIzXTTIEisyuwnFP9Wqv/dYxn6TpHvCP6gtsjGiHzRMnGS18k3rafdhKwDHdnkvvKDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIWb8U5X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIWb8U5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731112984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2qqOAOjGnJRNnVo9p9yG4fFRWGD1xSWB8iD20JDrN9M=;
	b=dIWb8U5XlT3Cd71rOWVsdVtSwVq05mk/YueIwWIQr9kmq46AhGjlrPYg2KYYNV3Hfy2TSt
	dlroiiAOCbG1h9Ls5UZqPxMgR69qCaORrOEDbqpyla6g6jmZP4tbcMDxdRkMeSv3vku8SC
	37lyI0CH3yHA4g1W9PAcCSpz9svihCY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-Pl6-3Oh1O1GPr_0YB-QJPA-1; Fri,
 08 Nov 2024 19:43:03 -0500
X-MC-Unique: Pl6-3Oh1O1GPr_0YB-QJPA-1
X-Mimecast-MFC-AGG-ID: Pl6-3Oh1O1GPr_0YB-QJPA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A8491956077
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 00:43:01 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 214761953880;
	Sat,  9 Nov 2024 00:43:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, da4373fb)
Date: Sat, 09 Nov 2024 00:43:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <27403.124110819430300111@us-mta-356.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I-S5BNh9zyz4AOAS7_-V0TbAZIgEaPqNYAucG2ck7SA_1731112981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.12-rc7' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1534276397

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1534276397-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1534276397-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1534276397-x86_64-kernel-debug


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


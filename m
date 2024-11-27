Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3628513BC35
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 22:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732747988; cv=none; b=KlYGATyXZXUzWbOy82o0prt5jEWt+FHktAmVZbrcYq37UIGDrKiDn5PPHXFya5nppeG3PKiU3IqGLY39cQT6vtbmG0ZJjucT/UlpS5abxdbqscguOdle4OBuvAfBxiid5Ev2/P6MWB8qAPebRoQusrmLjL2ptg7/AvMmN/dS+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732747988; c=relaxed/simple;
	bh=A5mx8A/bn1HGIn/Fs5y6108HpOJStTEaHxEgv9MqLj0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lJeFclWq9dhPzliQqLyUrD/Vu94C+MGPyzBt/QoB4wIa9wI7ihLDXESWd85gyjePgLpWnE9At4XMCWUDEhtpqKfRBPZnx9imyLKuU5GB34rZL2RPuMRsDVXg++a9dtHZZ5T6Du954TgWzzBzRcrK06iq5Byd0vM0MvmLNmDCX/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScTZ+y8y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScTZ+y8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732747985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MnYnyjSk3ukmY8P9UcbH92y0EWaWYZbVucfssqcOkBM=;
	b=ScTZ+y8yVsqfQHuZ47OCS4riAGC0GwRiQzeIz6cxEkPMw/K2FRwrf3pjJz5J1OC8al6zp5
	qJx6r4Nh0uYFwW00QWoTGUWsYIB5LrPtiXifzm8CzBLdrV/rfLgNFitETVIYoVW7yJc+o9
	I4FKwqoraxmkK30ZSZ8ooleyXkxYdjk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-CIixELH6M3euF4MuWbtPSg-1; Wed,
 27 Nov 2024 17:53:03 -0500
X-MC-Unique: CIixELH6M3euF4MuWbtPSg-1
X-Mimecast-MFC-AGG-ID: CIixELH6M3euF4MuWbtPSg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 050781945110
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 22:53:03 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0F2A1956086;
	Wed, 27 Nov 2024 22:53:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 9ad55a67)
Date: Wed, 27 Nov 2024 22:53:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <95263.124112717530301296@us-mta-668.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N-u2zO0MQw5ID1w4G1jQ6saXJzXX6zkEsy8r3B9vbvA_1732747983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'soundwire-6.13-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vkoul/soundwire

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1563394374

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1563394374-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1563394374-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1563394374-x86_64-kernel-debug


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


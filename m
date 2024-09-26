Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEB374EA
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360195; cv=none; b=QGNWB7ko+98DEiNWwLTRWqdUgc8oPWn6HIyIMyxB6Lfq8UjUyQR34PHx3K1YKIbMxCy1RYKV4RYlpbnCou8pmhOgr8kDSh2la2zUwXVaB9r4UV3Oik1mWQt1VEo0KOKs36RAT7PQoq/qC+uQ8zrSS7Ae0zV9zOGST7E4hgc5LxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360195; c=relaxed/simple;
	bh=6KcIU3z6PcNRAPE3iB3FUX2HVX9F/CCAgqC0K609d+E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eSbAI8BHNw112BCumU+xZhlfLklJ4SJcUVy4nkBNugxz8njjeONWQIegwWDhxufCvd46EW5GMKrWlBQ9thE0s7QDkrFWPFuIvJHDv6XgYceKzsOVX2o9t4TsSDMZ0u8vrH4AeM9RqtoO9OizPhC+Z7hulU8/JD7rGedPuaBo6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSbOW6iM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSbOW6iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1oNwy9E5Wwl1stvKF6Ns3dUK1IeDd7Rg350qrWWEMco=;
	b=WSbOW6iMVyDqHVBJZQUUz4IcT3c80kvx6niu5Mxcph8ZQGvLwEChTOZTscRu5FaGK1iich
	0il+wav/X6kIWmnH7GAT1Bes5ZSlaR1gLUiu4vxC7oDA685+uCwyLW6N7e/1c4B5CXuSA0
	UsIkZCRWaAgniQ50UT5gD1LHTMs4uwU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-e-H4NHE_Mh2cXb_Igslodw-1; Thu,
 26 Sep 2024 10:16:31 -0400
X-MC-Unique: e-H4NHE_Mh2cXb_Igslodw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D81A81936D28
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:30 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A10F3195419E;
	Thu, 26 Sep 2024 14:16:30 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, fdf042df)
Date: Thu, 26 Sep 2024 14:16:30 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <92497.124092610163102063@us-mta-363.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hwmon-for-v6.11-rc8' of git://git.kernel.org=
/pub/scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1451545792

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451545792-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451545792-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1451545792-x86_64-kernel-debug


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


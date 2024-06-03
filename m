Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DB1366
	for <llvm@lists.linux.dev>; Mon,  3 Jun 2024 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717435987; cv=none; b=skNE59+Bn9Us2mABq2uOL9k4Zch06FzSZTGX+k7VXh0ggST8Jdeu2+uBY4SDMv1lq7Y4QAGDNMtVf8Hzbp+gEuTX2VS4RuRGpCqCcewzkcUs6DsCh+V35OI+1Cv/Fwn1Y0NQr+YU0a+ueiVoV/97DtElQgjjsx8G7Bp3vkiiIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717435987; c=relaxed/simple;
	bh=SCS3NyFRHLvKa8kxcZORZb92HGeSMLnT4wZwbH56iQo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YehNBfaMqR2SEMAzKgjkWl106DsRpIyT7/A+cuiFwD8Ns1/pDBfhNwNXsXOKT9einP9i7ayMQdaADHpRbBBaltk3EorUKtaoLIZXGyDWzYu0xoo81F4O3FpyVB3pyxmf3Kw2c8Le9di8JF0TK1riW/m/DXcQgjHfxIEikfH3KBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4ezpv5S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4ezpv5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717435984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w5Hp6W3C9U4VGmLgZTRMhZxChsW2EWwS2vSv2CKgJJw=;
	b=c4ezpv5SwpjEhK/svGY4EMWkShMji9eNXEE5o2IW6aIVJwVDk4W+IqieJPl3D42ETFaMkd
	gC84jiDz3gF7kk4KqjvwIVk995g1mS8JtoddvBWAPHcQavmAVcjf9Z+v1fn7v8UU3HOdcL
	GX3vaATQekoTNln6iPejGiHh+Fw7xkU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-FcekpMEuNpe4DE0lsZwUtg-1; Mon,
 03 Jun 2024 13:33:03 -0400
X-MC-Unique: FcekpMEuNpe4DE0lsZwUtg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 320973806703
	for <llvm@lists.linux.dev>; Mon,  3 Jun 2024 17:33:02 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E19DB49103D;
	Mon,  3 Jun 2024 17:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, f06ce441)
Date: Mon, 03 Jun 2024 17:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Message-Id: <84507.124060313330301238@us-mta-527.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'loongarch-fixes-6.10-1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1316452952

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1316452952-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1316452952-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1316452952-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1316452952-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1316452952-x86_64-kernel-debug


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B621223717F
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746834187; cv=none; b=q1U4OtjzQQZqPJJHHpDrB4J0HB02h6T7585n+ICnJ2jPwZwt2bfFycmkttfrmveuCn4b6lkpTUNDYN/m+sudYrXNwHvKA2JRjNYsA52i7d19/ZnKEAXAqdXh8WMXcCQ6cl5amwFPkWfdGyJeX7zhSDHY4eHcgpQSnCxq1Fmxjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746834187; c=relaxed/simple;
	bh=fpwCG+IWhM+ZsyMgbAojaD2TukcZ5dPnS0N62CI/igI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=LruNSy2YMxP8QqBlb/kgrZ2l0rDqLwy7DENyo11GIV/EnpzIqlWJidMxPLtzia8XjdvwoMYgDv5IvT2p+qqRNkQtDMXpiXIcP8qx0WrdiYxyofIAGDWi/bh87TdCpnFDAPdz8X7aqPrFq1rNpVgTSPm/hW/eL/35eGOCFjlpgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=clCRC4XH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="clCRC4XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746834184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cLOYWBX1wvpH8ARPwhwCVOXX3b28FQcmgF/elZmsRxU=;
	b=clCRC4XHJp0/F/+pFhXOihhMxZ/zNqlP7UjQ71Vx4o0aHYqafnyKISHbvu5Izzo6DcqQxX
	LruSIQFY/9dAlBDIuNMu8222dSXN+WDSITnO2FtUY9wJu+mmhVSzTa1Fud4zebmY+T1w8f
	nJ6sM1DSAzPug55sVfWU/YnBZSbEjU4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-pk9vr6PDPLSqtwGUkzoeEA-1; Fri,
 09 May 2025 19:43:03 -0400
X-MC-Unique: pk9vr6PDPLSqtwGUkzoeEA-1
X-Mimecast-MFC-AGG-ID: pk9vr6PDPLSqtwGUkzoeEA_1746834182
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29372180045B
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 23:43:02 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8ABE19560B0;
	Fri,  9 May 2025 23:43:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, 0e1329d4)
Date: Fri, 09 May 2025 23:43:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <72374.125050919430300183@us-mta-18.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oVag_KZIBY8l8kYaX1oq4S9BMKmUoc_QUmedS4VnVoE_1746834182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-fixes-6.15-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1810138081

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1810138081-x86_64-kernel-debug


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


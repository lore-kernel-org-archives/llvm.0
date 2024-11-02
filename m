Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972823EA98
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 03:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730518930; cv=none; b=qHzLT5RI7DrYhy8pF8m1aOpvRDsBStkauN+PMoD+CvpmrNkaJF4/V/NjZzM18U1jkPH3vXpVAP2TzK3cIgujpWMCvF8RuyKtUyCeqpIEv3foD2rD7ALzQKT4CpiPNSsenYXFPkpF/Fzb2BBcy7ULDi2sbAeONza6H6/iafjHAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730518930; c=relaxed/simple;
	bh=Z4ApCrXhmRngNKYjuQxSsniVMAc94htd9qagiJbZIsI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WtveH8517AfF+clfvZrbSptVkocJR3ask+95pKCL7n0Fp29RQqketvxnrTQ0V+ET3KCuEhVMZOicAU4sEH0J1Lz4MQJG+ze8dUVqD//bVXN/F22mFjmVDl96yQ/i17aJIjJwl3okW6APjLX3kCpks+IRSuR4VncVDW8z9SBBeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auM/s4cW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auM/s4cW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730518927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5TJvvKwHL9T0rK8WhaSH1hseBCLMHHGGTCEOST05/I=;
	b=auM/s4cWz8FVRbSW95NIgd+ZV3SeLFya1//n812NWnLEUuwVVOeWkf7v2SGwEtu3DPLOu3
	Q0SsevlTvTBgXOFhh3bfR9UldUsDavuYNpYzl/Xs7tdkRGWP4FStINgJtFwh+7I1Sdrcid
	Ov+sbIhoTDauSWzsfELOx7ZRCtQFUp0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-0rJ9qjXCPNOmn2MxJ-VN7A-1; Fri,
 01 Nov 2024 23:42:05 -0400
X-MC-Unique: 0rJ9qjXCPNOmn2MxJ-VN7A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5B9A1956080
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 03:42:04 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3933B195605A;
	Sat,  2 Nov 2024 03:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 upstream-mainline, 11066801)
Date: Sat, 02 Nov 2024 03:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <08255.124110123420500393@us-mta-329.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-fixes-6.12-rc6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1523987257

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1523987257-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1523987257-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1523987257-x86_64-kernel-debug


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


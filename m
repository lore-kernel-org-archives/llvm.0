Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E88A30103A
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139588; cv=none; b=ba5II3c7Dmo90qVlhZ4Y0G/ffB+oTeMeIDYnuUjmJ9UUivFCkJAnU/SHV7fN0j5Aa7QXmzEYAiPp3TyvXVY0+71gpQfy7ylfeHxR/7M9mw6JzCR+/zcgZdldSxGA659lqKJuPk5HKlc7Fff4vnZA4BqD5Ok78RxlehcbfXN5Ui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139588; c=relaxed/simple;
	bh=I1Wrt9lOX2TP5mT9tQ0jH6C4WE23J3XnQzUCujt7j54=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KGIRWy3LghK3cpb328anBRPS8YY3P7Fe4hiaZf4ENDq1aVYkMpdlwCRq/O3Mb6seYYN6fGBl3KpsIAMdjwtnNYlaD/F8upHwQQ0eTocgyCTnnYQzyvfbbUs2Bgiy0GBuzj4sQLsMQtfWFjPVe83ftQPa4L1nT+aKhQVBQ5m/IM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XR64Z/oI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XR64Z/oI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756139585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KtxGF0wg6Qp3cKXj2vJ6ZsDdVRjKNZ6v1rYhtBnFLLE=;
	b=XR64Z/oI7XkGnleu7mDCKvpSv8Ppdwuzr2Ud8hrwu84lJeN8d/bS/RT7uGlbyZFbIHSS1b
	Ugk8UY+37hXDdZV9toqCI3kwCmbOrgM9ovHm10SyDF4CZLf31ZFOvcuTYqyygD5x9lmyIE
	ssEwOlogl7J61CMV5LHC9y5RGO7t4Xo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-OkuRhd1UMLGQP7CvkMgKNg-1; Mon,
 25 Aug 2025 12:33:03 -0400
X-MC-Unique: OkuRhd1UMLGQP7CvkMgKNg-1
X-Mimecast-MFC-AGG-ID: OkuRhd1UMLGQP7CvkMgKNg_1756139583
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 088C6195608F
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 16:33:03 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8B1B219560AB;
	Mon, 25 Aug 2025 16:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc3,
 upstream-mainline, b6add54b)
Date: Mon, 25 Aug 2025 16:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <51362.125082512330301244@us-mta-541.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vkw_yJqeAz-t2vduhrAyXeO0JIzNUkFMTAeut6fM8lE_1756139583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pinctrl-v6.17-2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2002429711

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2002429711_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2002429711_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2002429711_x86_64_kernel-debug


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


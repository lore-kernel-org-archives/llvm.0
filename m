Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839FD27603B
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794591; cv=none; b=rqV+UHLCfVHT3l1ZIjvm6u2SMnT0KETWd/mQlE+WHxAUEKK2zykBBsM1AB5tdhcZssAXBSMJfRVnlyMUjrhRCFyic8v2ipelcuOVsq5O63clFOfDTBmYndEBOcVxbaQC0kyKguYWNnaEswJtVdvRDpPC16ekmQ9LuMTdcxcTHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794591; c=relaxed/simple;
	bh=w1Elm5OgRNOKrCJ2Vor0puP7Ag4jRHuBP75amJj+YvI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=URH7moBI29vhjwvAI8Xmh1eV1KC1Crzo7CYHB+n0Jb7Td4L0bt2cfiKNUGPwTZqlRfpYxR34aRkz9X8WBKERk8XWe7/CpL4mJEG73Y77WMXQMmQ8i5zlsVrQDHH2O96YnmcDkH/4O9WfBq9u2cmRRigBkoFf8+S8Ov41m4GQCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g13mLSvH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g13mLSvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755794588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FRZtJvgQusAkMbPY/1JJYj8SKLl/tHNQxsJeUnE/B/g=;
	b=g13mLSvH9AIOPkFChVPN4gU/99KwTOlKUOGIWlyeJ7SxSZatklwBUkobw6iKXhu3cV3PxV
	yKJ7wztIH73rk86ePHcZsqEFYhKEhS93BeZdwLTLgB50x6i7cnurEiPVWztJaZIwzwNWFm
	TbCqgBgqc+2tHXTljQb913gPD++K63o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-AZkWjaZyM5aG6_O9COdKuQ-1; Thu,
 21 Aug 2025 12:43:06 -0400
X-MC-Unique: AZkWjaZyM5aG6_O9COdKuQ-1
X-Mimecast-MFC-AGG-ID: AZkWjaZyM5aG6_O9COdKuQ_1755794586
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ACA5180028C
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 16:43:06 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 76FBA30001A1;
	Thu, 21 Aug 2025 16:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, 1c656b1e)
Date: Thu, 21 Aug 2025 16:43:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <83346.125082112430700165@us-mta-500.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eelY8gT90QJ1_cpp6pwiT2VAKdi8poaijHw8eqtvmx8_1755794586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'loongarch-fixes-6.17-1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1996738821

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1996738821_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1996738821_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1996738821_x86_64_kernel-debug


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


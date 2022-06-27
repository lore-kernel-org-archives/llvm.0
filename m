Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B233C2
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656340320; x=1687876320;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nyJcEKgDRGZ2YqPN5y0CET1rhsyGz/5bI1L2PhjRsPA=;
  b=eQCqqc+wqfb7IPgGWSKgckcvbYSb46WkJlx4qw7cJgV5V+TYSHztrrbp
   mqlDPc+qunrQlTagoR98vonFtZsrajFCmWlCxcIC/CO1zueuLiJ8kkbHP
   sESqeDxshKrXURWacCPtazJ+U5R6dL5uEF3FLoHp7pcZfFR6AvocibDXD
   lG32mJDNKSTTkPI4BhKeYrpO4WLu4QFzmot3WhWydi9+6CDcIp0iJilnh
   thMRDvMACyA0YlmxyWeC2KaJGVIjBHCmhuiLb7XRsFnCUPeR9w1ganLR4
   q9B6CezOHsQ8XmfsHVPCyd/JIUQBcOGOrDf7vBnXBrsqpa37kG3PugR2S
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="306936972"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="306936972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 07:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="836219361"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 07:31:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5pmK-0008e8-Pd;
	Mon, 27 Jun 2022 14:31:52 +0000
Date: Mon, 27 Jun 2022 22:31:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.15.y 1785/8107]
 drivers/usb/gadget/composite.c:1687:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value
Message-ID: <202206272209.RfLlBzRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/usb/gadget/composite.c: 1687:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/usb/gadget/legacy/dbgp.c: 353:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value [-Waddress-of-packed-member]

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   18a33c8dabb88b50b860e0177a73933f2c0ddf68
commit: 36dfdf11af49d3c009c711fb16f5c6e7a274505d [1785/8107] USB: gadget: detect too-big endpoint 0 requests
config: mips-randconfig-r014-20220627 (https://download.01.org/0day-ci/archive/20220627/202206272209.RfLlBzRa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=36dfdf11af49d3c009c711fb16f5c6e7a274505d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 36dfdf11af49d3c009c711fb16f5c6e7a274505d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/composite.c:705:16: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
           le16_add_cpu(&bos->wTotalLength, USB_DT_USB_EXT_CAP_SIZE);
                         ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:721:17: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SS_CAP_SIZE);
                                 ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:754:17: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(ssac));
                                 ^~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/composite.c:1687:30: warning: taking address of packed member 'wLength' of class or structure 'usb_ctrlrequest' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           __le16 *temp = (__le16 *)&ctrl->wLength;
                                                     ^~~~~~~~~~~~~
   4 warnings generated.
--
>> drivers/usb/gadget/legacy/dbgp.c:353:30: warning: taking address of packed member 'wLength' of class or structure 'usb_ctrlrequest' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           __le16 *temp = (__le16 *)&ctrl->wLength;
                                                     ^~~~~~~~~~~~~
   1 warning generated.


vim +1687 drivers/usb/gadget/composite.c

  1660	
  1661	/*
  1662	 * The setup() callback implements all the ep0 functionality that's
  1663	 * not handled lower down, in hardware or the hardware driver(like
  1664	 * device and endpoint feature flags, and their status).  It's all
  1665	 * housekeeping for the gadget function we're implementing.  Most of
  1666	 * the work is in config and function specific setup.
  1667	 */
  1668	int
  1669	composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
  1670	{
  1671		struct usb_composite_dev	*cdev = get_gadget_data(gadget);
  1672		struct usb_request		*req = cdev->req;
  1673		int				value = -EOPNOTSUPP;
  1674		int				status = 0;
  1675		u16				w_index = le16_to_cpu(ctrl->wIndex);
  1676		u8				intf = w_index & 0xFF;
  1677		u16				w_value = le16_to_cpu(ctrl->wValue);
  1678		u16				w_length = le16_to_cpu(ctrl->wLength);
  1679		struct usb_function		*f = NULL;
  1680		u8				endp;
  1681	
  1682		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1683			if (ctrl->bRequestType == USB_DIR_OUT) {
  1684				goto done;
  1685			} else {
  1686				/* Cast away the const, we are going to overwrite on purpose. */
> 1687				__le16 *temp = (__le16 *)&ctrl->wLength;
  1688	
  1689				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1690				w_length = USB_COMP_EP0_BUFSIZ;
  1691			}
  1692		}
  1693	
  1694		/* partial re-init of the response message; the function or the
  1695		 * gadget might need to intercept e.g. a control-OUT completion
  1696		 * when we delegate to it.
  1697		 */
  1698		req->zero = 0;
  1699		req->context = cdev;
  1700		req->complete = composite_setup_complete;
  1701		req->length = 0;
  1702		gadget->ep0->driver_data = cdev;
  1703	
  1704		/*
  1705		 * Don't let non-standard requests match any of the cases below
  1706		 * by accident.
  1707		 */
  1708		if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD)
  1709			goto unknown;
  1710	
  1711		switch (ctrl->bRequest) {
  1712	
  1713		/* we handle all standard USB descriptors */
  1714		case USB_REQ_GET_DESCRIPTOR:
  1715			if (ctrl->bRequestType != USB_DIR_IN)
  1716				goto unknown;
  1717			switch (w_value >> 8) {
  1718	
  1719			case USB_DT_DEVICE:
  1720				cdev->desc.bNumConfigurations =
  1721					count_configs(cdev, USB_DT_DEVICE);
  1722				cdev->desc.bMaxPacketSize0 =
  1723					cdev->gadget->ep0->maxpacket;
  1724				if (gadget_is_superspeed(gadget)) {
  1725					if (gadget->speed >= USB_SPEED_SUPER) {
  1726						cdev->desc.bcdUSB = cpu_to_le16(0x0320);
  1727						cdev->desc.bMaxPacketSize0 = 9;
  1728					} else {
  1729						cdev->desc.bcdUSB = cpu_to_le16(0x0210);
  1730					}
  1731				} else {
  1732					if (gadget->lpm_capable)
  1733						cdev->desc.bcdUSB = cpu_to_le16(0x0201);
  1734					else
  1735						cdev->desc.bcdUSB = cpu_to_le16(0x0200);
  1736				}
  1737	
  1738				value = min(w_length, (u16) sizeof cdev->desc);
  1739				memcpy(req->buf, &cdev->desc, value);
  1740				break;
  1741			case USB_DT_DEVICE_QUALIFIER:
  1742				if (!gadget_is_dualspeed(gadget) ||
  1743				    gadget->speed >= USB_SPEED_SUPER)
  1744					break;
  1745				device_qual(cdev);
  1746				value = min_t(int, w_length,
  1747					sizeof(struct usb_qualifier_descriptor));
  1748				break;
  1749			case USB_DT_OTHER_SPEED_CONFIG:
  1750				if (!gadget_is_dualspeed(gadget) ||
  1751				    gadget->speed >= USB_SPEED_SUPER)
  1752					break;
  1753				fallthrough;
  1754			case USB_DT_CONFIG:
  1755				value = config_desc(cdev, w_value);
  1756				if (value >= 0)
  1757					value = min(w_length, (u16) value);
  1758				break;
  1759			case USB_DT_STRING:
  1760				value = get_string(cdev, req->buf,
  1761						w_index, w_value & 0xff);
  1762				if (value >= 0)
  1763					value = min(w_length, (u16) value);
  1764				break;
  1765			case USB_DT_BOS:
  1766				if (gadget_is_superspeed(gadget) ||
  1767				    gadget->lpm_capable) {
  1768					value = bos_desc(cdev);
  1769					value = min(w_length, (u16) value);
  1770				}
  1771				break;
  1772			case USB_DT_OTG:
  1773				if (gadget_is_otg(gadget)) {
  1774					struct usb_configuration *config;
  1775					int otg_desc_len = 0;
  1776	
  1777					if (cdev->config)
  1778						config = cdev->config;
  1779					else
  1780						config = list_first_entry(
  1781								&cdev->configs,
  1782							struct usb_configuration, list);
  1783					if (!config)
  1784						goto done;
  1785	
  1786					if (gadget->otg_caps &&
  1787						(gadget->otg_caps->otg_rev >= 0x0200))
  1788						otg_desc_len += sizeof(
  1789							struct usb_otg20_descriptor);
  1790					else
  1791						otg_desc_len += sizeof(
  1792							struct usb_otg_descriptor);
  1793	
  1794					value = min_t(int, w_length, otg_desc_len);
  1795					memcpy(req->buf, config->descriptors[0], value);
  1796				}
  1797				break;
  1798			}
  1799			break;
  1800	
  1801		/* any number of configs can work */
  1802		case USB_REQ_SET_CONFIGURATION:
  1803			if (ctrl->bRequestType != 0)
  1804				goto unknown;
  1805			if (gadget_is_otg(gadget)) {
  1806				if (gadget->a_hnp_support)
  1807					DBG(cdev, "HNP available\n");
  1808				else if (gadget->a_alt_hnp_support)
  1809					DBG(cdev, "HNP on another port\n");
  1810				else
  1811					VDBG(cdev, "HNP inactive\n");
  1812			}
  1813			spin_lock(&cdev->lock);
  1814			value = set_config(cdev, ctrl, w_value);
  1815			spin_unlock(&cdev->lock);
  1816			break;
  1817		case USB_REQ_GET_CONFIGURATION:
  1818			if (ctrl->bRequestType != USB_DIR_IN)
  1819				goto unknown;
  1820			if (cdev->config)
  1821				*(u8 *)req->buf = cdev->config->bConfigurationValue;
  1822			else
  1823				*(u8 *)req->buf = 0;
  1824			value = min(w_length, (u16) 1);
  1825			break;
  1826	
  1827		/* function drivers must handle get/set altsetting */
  1828		case USB_REQ_SET_INTERFACE:
  1829			if (ctrl->bRequestType != USB_RECIP_INTERFACE)
  1830				goto unknown;
  1831			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1832				break;
  1833			f = cdev->config->interface[intf];
  1834			if (!f)
  1835				break;
  1836	
  1837			/*
  1838			 * If there's no get_alt() method, we know only altsetting zero
  1839			 * works. There is no need to check if set_alt() is not NULL
  1840			 * as we check this in usb_add_function().
  1841			 */
  1842			if (w_value && !f->get_alt)
  1843				break;
  1844	
  1845			spin_lock(&cdev->lock);
  1846			value = f->set_alt(f, w_index, w_value);
  1847			if (value == USB_GADGET_DELAYED_STATUS) {
  1848				DBG(cdev,
  1849				 "%s: interface %d (%s) requested delayed status\n",
  1850						__func__, intf, f->name);
  1851				cdev->delayed_status++;
  1852				DBG(cdev, "delayed_status count %d\n",
  1853						cdev->delayed_status);
  1854			}
  1855			spin_unlock(&cdev->lock);
  1856			break;
  1857		case USB_REQ_GET_INTERFACE:
  1858			if (ctrl->bRequestType != (USB_DIR_IN|USB_RECIP_INTERFACE))
  1859				goto unknown;
  1860			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1861				break;
  1862			f = cdev->config->interface[intf];
  1863			if (!f)
  1864				break;
  1865			/* lots of interfaces only need altsetting zero... */
  1866			value = f->get_alt ? f->get_alt(f, w_index) : 0;
  1867			if (value < 0)
  1868				break;
  1869			*((u8 *)req->buf) = value;
  1870			value = min(w_length, (u16) 1);
  1871			break;
  1872		case USB_REQ_GET_STATUS:
  1873			if (gadget_is_otg(gadget) && gadget->hnp_polling_support &&
  1874							(w_index == OTG_STS_SELECTOR)) {
  1875				if (ctrl->bRequestType != (USB_DIR_IN |
  1876								USB_RECIP_DEVICE))
  1877					goto unknown;
  1878				*((u8 *)req->buf) = gadget->host_request_flag;
  1879				value = 1;
  1880				break;
  1881			}
  1882	
  1883			/*
  1884			 * USB 3.0 additions:
  1885			 * Function driver should handle get_status request. If such cb
  1886			 * wasn't supplied we respond with default value = 0
  1887			 * Note: function driver should supply such cb only for the
  1888			 * first interface of the function
  1889			 */
  1890			if (!gadget_is_superspeed(gadget))
  1891				goto unknown;
  1892			if (ctrl->bRequestType != (USB_DIR_IN | USB_RECIP_INTERFACE))
  1893				goto unknown;
  1894			value = 2;	/* This is the length of the get_status reply */
  1895			put_unaligned_le16(0, req->buf);
  1896			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1897				break;
  1898			f = cdev->config->interface[intf];
  1899			if (!f)
  1900				break;
  1901			status = f->get_status ? f->get_status(f) : 0;
  1902			if (status < 0)
  1903				break;
  1904			put_unaligned_le16(status & 0x0000ffff, req->buf);
  1905			break;
  1906		/*
  1907		 * Function drivers should handle SetFeature/ClearFeature
  1908		 * (FUNCTION_SUSPEND) request. function_suspend cb should be supplied
  1909		 * only for the first interface of the function
  1910		 */
  1911		case USB_REQ_CLEAR_FEATURE:
  1912		case USB_REQ_SET_FEATURE:
  1913			if (!gadget_is_superspeed(gadget))
  1914				goto unknown;
  1915			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
  1916				goto unknown;
  1917			switch (w_value) {
  1918			case USB_INTRF_FUNC_SUSPEND:
  1919				if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1920					break;
  1921				f = cdev->config->interface[intf];
  1922				if (!f)
  1923					break;
  1924				value = 0;
  1925				if (f->func_suspend)
  1926					value = f->func_suspend(f, w_index >> 8);
  1927				if (value < 0) {
  1928					ERROR(cdev,
  1929					      "func_suspend() returned error %d\n",
  1930					      value);
  1931					value = 0;
  1932				}
  1933				break;
  1934			}
  1935			break;
  1936		default:
  1937	unknown:
  1938			/*
  1939			 * OS descriptors handling
  1940			 */
  1941			if (cdev->use_os_string && cdev->os_desc_config &&
  1942			    (ctrl->bRequestType & USB_TYPE_VENDOR) &&
  1943			    ctrl->bRequest == cdev->b_vendor_code) {
  1944				struct usb_configuration	*os_desc_cfg;
  1945				u8				*buf;
  1946				int				interface;
  1947				int				count = 0;
  1948	
  1949				req = cdev->os_desc_req;
  1950				req->context = cdev;
  1951				req->complete = composite_setup_complete;
  1952				buf = req->buf;
  1953				os_desc_cfg = cdev->os_desc_config;
  1954				w_length = min_t(u16, w_length, USB_COMP_EP0_OS_DESC_BUFSIZ);
  1955				memset(buf, 0, w_length);
  1956				buf[5] = 0x01;
  1957				switch (ctrl->bRequestType & USB_RECIP_MASK) {
  1958				case USB_RECIP_DEVICE:
  1959					if (w_index != 0x4 || (w_value >> 8))
  1960						break;
  1961					buf[6] = w_index;
  1962					/* Number of ext compat interfaces */
  1963					count = count_ext_compat(os_desc_cfg);
  1964					buf[8] = count;
  1965					count *= 24; /* 24 B/ext compat desc */
  1966					count += 16; /* header */
  1967					put_unaligned_le32(count, buf);
  1968					value = w_length;
  1969					if (w_length > 0x10) {
  1970						value = fill_ext_compat(os_desc_cfg, buf);
  1971						value = min_t(u16, w_length, value);
  1972					}
  1973					break;
  1974				case USB_RECIP_INTERFACE:
  1975					if (w_index != 0x5 || (w_value >> 8))
  1976						break;
  1977					interface = w_value & 0xFF;
  1978					buf[6] = w_index;
  1979					count = count_ext_prop(os_desc_cfg,
  1980						interface);
  1981					put_unaligned_le16(count, buf + 8);
  1982					count = len_ext_prop(os_desc_cfg,
  1983						interface);
  1984					put_unaligned_le32(count, buf);
  1985					value = w_length;
  1986					if (w_length > 0x0A) {
  1987						value = fill_ext_prop(os_desc_cfg,
  1988								      interface, buf);
  1989						if (value >= 0)
  1990							value = min_t(u16, w_length, value);
  1991					}
  1992					break;
  1993				}
  1994	
  1995				goto check_value;
  1996			}
  1997	
  1998			VDBG(cdev,
  1999				"non-core control req%02x.%02x v%04x i%04x l%d\n",
  2000				ctrl->bRequestType, ctrl->bRequest,
  2001				w_value, w_index, w_length);
  2002	
  2003			/* functions always handle their interfaces and endpoints...
  2004			 * punt other recipients (other, WUSB, ...) to the current
  2005			 * configuration code.
  2006			 */
  2007			if (cdev->config) {
  2008				list_for_each_entry(f, &cdev->config->functions, list)
  2009					if (f->req_match &&
  2010					    f->req_match(f, ctrl, false))
  2011						goto try_fun_setup;
  2012			} else {
  2013				struct usb_configuration *c;
  2014				list_for_each_entry(c, &cdev->configs, list)
  2015					list_for_each_entry(f, &c->functions, list)
  2016						if (f->req_match &&
  2017						    f->req_match(f, ctrl, true))
  2018							goto try_fun_setup;
  2019			}
  2020			f = NULL;
  2021	
  2022			switch (ctrl->bRequestType & USB_RECIP_MASK) {
  2023			case USB_RECIP_INTERFACE:
  2024				if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  2025					break;
  2026				f = cdev->config->interface[intf];
  2027				break;
  2028	
  2029			case USB_RECIP_ENDPOINT:
  2030				if (!cdev->config)
  2031					break;
  2032				endp = ((w_index & 0x80) >> 3) | (w_index & 0x0f);
  2033				list_for_each_entry(f, &cdev->config->functions, list) {
  2034					if (test_bit(endp, f->endpoints))
  2035						break;
  2036				}
  2037				if (&f->list == &cdev->config->functions)
  2038					f = NULL;
  2039				break;
  2040			}
  2041	try_fun_setup:
  2042			if (f && f->setup)
  2043				value = f->setup(f, ctrl);
  2044			else {
  2045				struct usb_configuration	*c;
  2046	
  2047				c = cdev->config;
  2048				if (!c)
  2049					goto done;
  2050	
  2051				/* try current config's setup */
  2052				if (c->setup) {
  2053					value = c->setup(c, ctrl);
  2054					goto done;
  2055				}
  2056	
  2057				/* try the only function in the current config */
  2058				if (!list_is_singular(&c->functions))
  2059					goto done;
  2060				f = list_first_entry(&c->functions, struct usb_function,
  2061						     list);
  2062				if (f->setup)
  2063					value = f->setup(f, ctrl);
  2064			}
  2065	
  2066			goto done;
  2067		}
  2068	
  2069	check_value:
  2070		/* respond with data transfer before status phase? */
  2071		if (value >= 0 && value != USB_GADGET_DELAYED_STATUS) {
  2072			req->length = value;
  2073			req->context = cdev;
  2074			req->zero = value < w_length;
  2075			value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
  2076			if (value < 0) {
  2077				DBG(cdev, "ep_queue --> %d\n", value);
  2078				req->status = 0;
  2079				composite_setup_complete(gadget->ep0, req);
  2080			}
  2081		} else if (value == USB_GADGET_DELAYED_STATUS && w_length != 0) {
  2082			WARN(cdev,
  2083				"%s: Delayed status not supported for w_length != 0",
  2084				__func__);
  2085		}
  2086	
  2087	done:
  2088		/* device either stalls (value < 0) or reports success */
  2089		return value;
  2090	}
  2091	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
